import 'package:sqflite/sqflite.dart';
import 'package:todo_app/views/home_page.dart';

Future<Database> createDataBase() async {
  database = await openDatabase(
    'todoo.db',
    version: 1,
    onCreate: (database, version) {
      print('data base created');
      // When creating the db, create the table
      database
          .execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, t)')
          .then((value) {
        print('table created');
      }).catchError((err) {
        print('error when create table ${err.toString()}');
      });
    },
    onOpen: (database) {
      print('dataBase opened');
    },
  );
  return database;
}
