import 'package:chatter/screens/chat_screen.dart';
import 'package:chatter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  late final userListController = StreamUserListController(
    client: StreamChatCore.of(context).client,
    limit: 20,
    filter: Filter.notEqual('id', StreamChatCore.of(context).currentUser!.id),
  );

  @override
  void initState() {
    userListController.doInitialLoad();
    super.initState();
  }

  @override
  void dispose() {
    userListController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PagedValueListenableBuilder<int, User>(
      valueListenable: userListController,
      builder: (context, value, child) {
        return value.when(
          (users, nextPageKey, error) {
            if (users.isEmpty) {
              return const Center(child: Text('There are no users'));
            }
            return LazyLoadScrollView(
              onEndOfPage: () async {
                if (nextPageKey != null) {
                  userListController.loadMore(nextPageKey);
                }
              },
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return _ContactTile(user: users[index]);
                },
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e) => DisplayErrorMessage(error: e),
        );
      },
    );
  }
}

class _ContactTile extends StatefulWidget {
  const _ContactTile({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<_ContactTile> createState() => _ContactTileState();
}

class _ContactTileState extends State<_ContactTile> {
  Future<void> createChannel(BuildContext context) async {
    final core = StreamChatCore.of(context);
    final nav = Navigator.of(context);
    final channel = core.client.channel('messaging', extraData: {
      'members': [
        core.currentUser!.id,
        widget.user.id,
      ]
    });
    await channel.watch();

    nav.push(
      ChatScreen.routeWithChannel(channel),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        createChannel(context);
      },
      child: ListTile(
        leading: Avatar.small(url: widget.user.image),
        title: Text(widget.user.name),
      ),
    );
  }
}
