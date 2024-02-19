// import 'package:sqflite/sqflite.dart';

// void createDataBase(var database) async {
//   database = await openDatabase(
//     'todo.db',
//     version: 1,
//     onCreate: (database, version) {
//       print('data base created');
//       // When creating the db, create the table
//       database
//           .execute(
//               'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, t)')
//           .then((value) {
//         print('table created');
//       }).catchError((err) {
//         print('error when create table ${err.toString()}');
//       });
//     },
//     onOpen: (database) {
//       print('dataBase opened');
//     },
//   );
// }
