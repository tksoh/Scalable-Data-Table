import 'dart:math';

class User {
  final int index;
  final String name;
  final String surname;
  final int points;
  final DateTime createdAt;
  final List<String> interests;

  User({
    required this.index,
    required this.name,
    required this.surname,
    required this.points,
    required this.createdAt,
    required this.interests,
  });
}

const _names = [
  'Oliver',
  'Jake',
  'Noah',
  'James',
  'Jack',
  'Connor',
  'Liam',
  'John',
  'Harry',
  'Callum',
  'Mason',
  'Robert',
  'Michael',
  'Charlie',
  'Kyle',
  'William',
  'Thomas',
  'Joe',
  'Ethan',
  'David',
  'George',
  'Reece',
  'Michael',
  'Richard',
  'Oscar',
  'Alexander',
  'Joseph',
  'James',
  'Charlie',
  'James',
  'Charles',
  'William',
  'Damian',
  'Daniel',
  'Thomas',
];

const _surnames = [
  'Smith',
  'Murphy',
  'Smith',
  'Jones',
  'O\'Kelly',
  'Johnson',
  'Williams',
  'O\'Sullivan',
  'Williams',
  'Brown',
  'Walsh',
  'Brown',
  'Taylor',
  'Smith',
  'Jones',
  'Davies',
  'O\'Brien',
  'Miller',
  'Wilson',
  'Byrne',
  'Davis',
  'Evans',
  'O\'Ryan',
  'Garcia',
  'Thomas',
  'O\'Connor',
  'Rodriguez',
  'Roberts',
  'O\'Neill',
  'Wilson',
];

final _random = Random();
String _createName() => _names[_random.nextInt(_names.length)];
String _createSurname() => _surnames[_random.nextInt(_surnames.length)];

Future<List<User>> createUsers(int columnIndex, bool ascending) {
  return Future.delayed(
    const Duration(seconds: 0),
    () {
      var list = List.generate(
        500,
        (index) => User(
          index: index,
          name: _createName(),
          surname: _createSurname(),
          createdAt: DateTime.now().subtract(Duration(minutes: index * 30)),
          points: index * 5,
          interests: List.generate(
            _random.nextInt(30),
            (_) => '${_createName()} ${_createSurname()}',
          ),
        ),
      );

      switch (columnIndex) {
        case 0:
          list.sort((a, b) => ascending
              ? a.index.compareTo(b.index)
              : b.index.compareTo(a.index));
          break;
        case 1:
          list.sort((a, b) => ascending
              ? a.createdAt.compareTo(b.createdAt)
              : b.createdAt.compareTo(a.createdAt));
          break;
        case 2:
          list.sort((a, b) =>
              ascending ? a.name.compareTo(b.name) : b.name.compareTo(a.name));
          break;
        case 3:
          list.sort((a, b) => ascending
              ? a.surname.compareTo(b.surname)
              : b.surname.compareTo(a.surname));
          break;
        case 4:
          list.sort((a, b) => ascending
              ? a.points.compareTo(b.points)
              : b.points.compareTo(a.points));
          break;
      }
      return list;
    },
  );
}
