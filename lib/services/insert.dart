// import 'package:sqflite/sqflite.dart';

// void inserData(Database database) async {
//   await database.transaction((txn) async {
//     await txn
//         .rawInsert(
//             'INSERT INTO tasks(title, date, time, status) VALUES("first task", "2022","5.00", "good")')
//         .then((value) {
//       print('$value inserted successfully');
//     }).catchError((err) {
//       print('error of insert');
//     });
//     return null;
//   });
// }
