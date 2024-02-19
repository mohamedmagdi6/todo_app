import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/services/create_data_base.dart';
import 'package:todo_app/services/insert.dart';

import 'package:todo_app/widgets/archived_body.dart';
import 'package:todo_app/widgets/done_body.dart';
import 'package:todo_app/widgets/taske_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int currentIndex = 0;
List<Widget> bodyList = [
  const TasksBody(),
  const DoneBody(),
  const ArchivedBody()
];

List<String> titleTextList = ['Task Page', 'Done Page', 'Archived Page'];
late Database database;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createDataBase();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          titleTextList[currentIndex],
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          inserData();
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.menu,
              ),
              label: 'Tasks'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.done,
              ),
              label: 'Done'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.archive,
              ),
              label: 'Archived'),
        ],
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
      body: bodyList[currentIndex],
    );
  }

  void createDataBase() async {
    database = await openDatabase(
      'todoo.db',
      version: 1,
      onCreate: (database, version) {
        print('data base created');
        // When creating the db, create the table
        database
            .execute(
                'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT,status TEXT)')
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
  }

  void inserData() async {
    await database.transaction((txn) async {
      await txn
          .rawInsert(
              'INSERT INTO tasks(title, date, time, status) VALUES("first task", "2022","5.00", "new")')
          .then((value) {
        print('$value inserted successfully');
      }).catchError((err) {
        print('error of insert ${err}');
      });
      return null;
    });
  }
}
