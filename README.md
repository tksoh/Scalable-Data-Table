<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

Data Table package that uses builder property to only build the active rows
at the moment. Similar to ListView.builder, it improves the performance in
tables with many rows.

## Features
- Horizontal scroll if , use the ```minWidth``` property.
- Sticky Header: The header will be visible at all times and the rows will
get the rest of the available space.

## Getting started
Add the package to your project by running ```flutter pub add scalable_data_table```.
You can also add it manually in the ```pubspec.yaml``` file.

## Usage

Check the `/example` folder for the example project.

```dart
const like = 'sample';
```
