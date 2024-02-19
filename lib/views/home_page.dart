import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/services/create_data_base.dart';
import 'package:todo_app/services/insert.dart';
import 'package:todo_app/widgets/archived_body.dart';
import 'package:todo_app/widgets/costum_bottom_navigation_bar.dart';
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
      bottomNavigationBar: CustomBottomNavigationBar(
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          currentIndex: currentIndex),
      body: bodyList[currentIndex],
    );
  }
}
