import 'package:todo_app/views/home_page.dart';

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
