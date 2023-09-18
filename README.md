# lets_eat

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

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

**Riverpod** has a central **Provider** which provides a dynamic value and also methods to change the value

Then in the respective widgets that require this dynamic value one can create a **Consumer**

In a consumer widget one can listen to or triggers changes to the dynamic value by using the methods provided by the **Provider**
