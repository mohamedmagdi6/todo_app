import 'package:todo_app/views/home_page.dart';

void inserData(
    {required String title, required String date, required String time}) async {
  await database.transaction((txn) async {
    await txn
        .rawInsert(
            'INSERT INTO tasks(title, date, time, status) VALUES("$title", "$date","$time", "new")')
        .then((value) {
      print('$value inserted successfully');
    }).catchError((err) {
      print('error of insert ${err}');
    });
    return null;
  });
}
