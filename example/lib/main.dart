import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:example/data.dart';
import 'package:scalable_data_table/scalable_data_table.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Scalable Data Table',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          const Expanded(child: UsersTable()),
        ],
      ),
    );
  }
}

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
            color: (index % 2 == 0) ? Colors.grey[200]! : Colors.transparent,
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
