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

Data Table package makes it possible to create a data table with hundreds
of rows, which is not possible using the default ```DataTable``` widget
because of performance reasons.

## Features
- ScalableDataTable only builds the rows that are visible at each moment
(similar to ListView.builder)
- Horizontal scroll if , use the ```minWidth``` property.
- Sticky Header: The header will be visible at all times and the rows will
get the rest of the available space.

## Getting started
Add the package to your project by running ```flutter pub add scalable_data_table```.
You can also add it manually in the ```pubspec.yaml``` file.

## Usage

Check the `/example` folder for the example project.

```dart
class UsersTable extends StatelessWidget {
  const UsersTable({Key? key}) : super(key: key);

  static final _dateFormat = DateFormat('HH:mm dd/MM');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
      future: createUsers(),
      builder: (context, snapshot) => ScalableDataTable(
        header: DefaultTextStyle(
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey[700],
          ),
          child: ScalableTableHeader(
            columnWrapper: columnWrapper,
            children: [
              const SizedBox(),
              const Text('Created At'),
              const Text('Name'),
              const Text('Surname'),
              const Text('Points'),
              const Text('Interests'),
            ],
          ),
        ),
        rowBuilder: (context, index) {
          final user = snapshot.data![index];
          return ScalableTableRow(
            columnWrapper: columnWrapper,
            color: MaterialStateColor.resolveWith((states) =>
                (index % 2 == 0) ? Colors.grey[200]! : Colors.transparent),
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text('${user.index}.'),
              ),
              Text(_dateFormat.format(user.createdAt)),
              Text(user.name),
              Text(user.surname),
              Text('${user.points} pts'),
              Text(user.interests.join(', '), maxLines: 2),
            ],
          );
        },
        emptyBuilder: (context) => const Text('No users yet...'),
        itemCount: snapshot.data?.length ?? -1,
        minWidth: 1000, // max(MediaQuery.of(context).size.width, 1000),
        textStyle: TextStyle(color: Colors.grey[700], fontSize: 14),
      ),
    );
  }

  Widget columnWrapper(BuildContext context, int columnIndex, Widget child) {
    const padding = EdgeInsets.symmetric(horizontal: 10);
    switch (columnIndex) {
      case 0:
        return Container(
          width: 60,
          padding: padding,
          child: child,
        );
      case 1:
        return Container(
          width: 100,
          padding: padding,
          child: child,
        );
      case 5:
        return Expanded(
          flex: 3,
          child: Container(
            padding: padding,
            child: child,
          ),
        );
      default:
        return Expanded(
          child: Container(
            padding: padding,
            child: child,
          ),
        );
    }
  }
}
```

![example gif](https://raw.githubusercontent.com/LucaDillenburg/Scalable-Data-Table/stable/assets/example.gif)
