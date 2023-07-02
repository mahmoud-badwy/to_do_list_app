import 'package:flutter/material.dart';
import '../constants/databases/shared_sql.dart';

class SharedController with ChangeNotifier {
  MySharedSqlDb mySqlDb = MySharedSqlDb();

  List<Map> allData = [];

  Future<void> getData() async {
    Future<List<Map>> response = mySqlDb.readData('shareds');
    allData = await response;
  }

  insertData() async {
    if (allData.isEmpty) {
      var response = mySqlDb.insertData('shareds');
      print('inserted');
    } else {
      print('data already added');
      print(allData);
    }
  }

  Future<void> changeData() async {}
}
