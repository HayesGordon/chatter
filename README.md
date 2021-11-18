# Chatter - Building a Flutter chat application from scratch

See the relevant branch for the tutorial you'd like to follow. The `main` branch has the latest source code.

## Installation instructions

```bash
git clone https://github.com/HayesGordon/chatter.git
```

Check out the required branch

```bash
git checkout {branch-name}
```

Install dependencies
```bash
flutter pub get
```

Generate the needed platform folders (Android, iOS). Some of the branches may have these already included.

```bash
flutter create .
```

## Further Setup

Add your Stream app's key in `lib/app.dart`.

From [episode 3](https://github.com/HayesGordon/chatter/tree/tutorial-002-stream-chat-flutter-core-complete) the application requires Firebase Authentication and Cloud Functions to be setup. See the third [tutorial video](https://youtu.be/-s5iU9D5-AI) for complete information.

## Episodes / Tutorials

![Episode 1 - Design/UI](https://user-images.githubusercontent.com/13705472/133966143-57658323-8de3-4060-b4cc-343c8c17cda1.jpg)

**Episode 01 - Design/UI** \[ [Video](https://youtu.be/vgqBc7jni8c) \] \[ [Entry Code](https://github.com/HayesGordon/chatter/tree/tutorial-001-base-ui) \] \[ [Completed Code](https://github.com/HayesGordon/chatter/tree/tutorial-001-base-ui-complete) \] - Create the UI and structure for the application.

![Episode 02 - Stream API](https://user-images.githubusercontent.com/13705472/133966035-96604a21-0625-4114-a76d-bb938c72493f.jpg)

**Episode 02 - Stream API** \[ [Video](https://youtu.be/-s5iU9D5-AI) \] \[ [Entry Code](https://github.com/HayesGordon/chatter/tree/tutorial-002-stream-chat-flutter-core) \] \[ [Completed Code](https://github.com/HayesGordon/chatter/tree/tutorial-002-stream-chat-flutter-core-complete) \] - Connect to the Stream API with basic chat functionality

![Episode 03 - Firebase Auth and Functions](https://user-images.githubusercontent.com/13705472/142460816-e8eafd74-1884-41f3-8935-cb0611610331.jpg)

**Episode 03 - Firebase Auth and Functions** \[ [Video](https://youtu.be/y6OlrO3Bzag) \] \[ [Entry Code](https://github.com/HayesGordon/chatter/tree/tutorial-003-firebase-authentication) \] \[ [Completed Code](https://github.com/HayesGordon/chatter/tree/tutorial-003-firebase-authentication-complete) \] - Use Firebase Authentication and Cloud Function to generate Stream API user tokens
