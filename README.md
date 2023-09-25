# lets_eat

A new [Flutter](https://docs.flutter.dev "Flutter docs") project

[Flutter Cookbook Contents](https://docs.flutter.dev/cookbook "check contents")

This cookbook contains recipes that demonstrate how to solve common problems while writing Flutter apps

Each recipe is self-contained and can be used as a reference to help you build up an application

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### [Networking & http](https://docs.flutter.dev/data-and-backend/networking "read docs")

- [JSON and serialization](https://docs.flutter.dev/data-and-backend/serialization/json "read docs")

### Navigation & Multi-Screen Apps

Navigation in flutter is like stacking/layering  screens

[Named route navigation docs](https://docs.flutter.dev/development/ui/navigation#using-named-routes "not recommended")

**Named route navigation example**

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const FirstScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => const SecondScreen(),
      },
    ),
  );
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          // Within the `FirstScreen` widget
          onPressed: () {
            // Navigate to the second screen using a named route.
            Navigator.pushNamed(context, '/second');
          },
          child: const Text('Launch screen'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          // Within the SecondScreen widget
          onPressed: () {
            // Navigate back to the first screen by popping the current route
            // off the stack.
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
```

### Managing Screen stacks

### Tab Bar

### Side Drawer

### ["Transparent Image Placeholder package"](https://pub.dev/packages/transparent_image/install)

## State Management

![state_mgmt](https://github.com/NSM722/lets_eat/assets/83452606/2ab5fe15-787c-4be1-a04b-53a2fc5c7d50)

The above approach is complex and verbose since the `onToggleFavorite` is being passed on to multiple widgets and screen layers

### ["Riverpod package" for cross widget state management](https://riverpod.dev/ "read docs for installation")

```terminal
flutter pub add flutter_riverpod
```

The below info-graphic shows the different approach when using **riverpod**

![riverpod](https://github.com/NSM722/lets_eat/assets/83452606/b8c75614-264f-41bf-80d1-d90e818149d9)

**Riverpod** has a central **Provider** which provides a dynamic value and also methods to change the value

Then in the respective widgets that require this dynamic value one can create a **Consumer**

In a **Consumer Widget** one can listen to or trigger changes to the dynamic value by using the methods provided by the **Provider**

### [BLoc / Rx](https://docs.flutter.dev/data-and-backend/state-mgmt/options#bloc--rx "read docs")

- [Architect your Flutter project using BLOC pattern](https://medium.com/codechai/architecting-your-flutter-project-bd04e144a8f1 "medium blog")
- [BLoC library state management](https://bloclibrary.dev/#/ "read docs")
- [Reactive programming - practical use cases](https://www.didierboelens.com/blog "flutter blog")

**BLoC Pattern**
It is a state management system for Flutter recommended by Google developers

It helps in managing state and make access to data from a central place in your project

One can co-relate this architecture to ones such as ***MVC*** or ***MVVM*** whereby the third part of both is replaced by ***BLoC**

Hence **BLoC** is the controller here

In general terms, data will be flowing from the BLOC to the UI or from UI to the BLOC in the form of streams

### Explicit and Implicit animations

An explicit animation is controlled by the programmer and is a bit complex

An implicit animation is controlled by flutter and is a lot less complex

[Flutter pre-built Animation and Motion widgets](https://docs.flutter.dev/ui/widgets/animation "explore widgets")
