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

[Name route navigation docs](https://docs.flutter.dev/development/ui/navigation#using-named-routes "not recommended")

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
