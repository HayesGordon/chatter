import 'package:flutter/material.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

import '../theme.dart';

/// Widget for showing an unread indicator
class UnreadIndicator extends StatelessWidget {
  /// Constructor for creating an [UnreadIndicator]
  const UnreadIndicator({
    Key? key,
    required this.channel,
  }) : super(key: key);

  final Channel channel;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: BetterStreamBuilder<int>(
        stream: channel.state!.unreadCountStream,
        initialData: channel.state!.unreadCount,
        builder: (context, data) {
          if (data == 0) {
            return const SizedBox.shrink();
          }
          return Material(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.secondary,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 5,
                right: 5,
                top: 2,
                bottom: 1,
              ),
              child: Center(
                child: Text(
                  '${data > 99 ? '99+' : data}',
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
