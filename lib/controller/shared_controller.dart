import 'package:flutter/material.dart';
import '../constants/databases/shared_sql.dart';

class SharedController with ChangeNotifier {
  MySharedSqlDb mySqlDb = MySharedSqlDb();

  List<Map> allData = [];

  Future<void> getData() async {
    Future<List<Map>> response = mySqlDb.readData('shareds');
    allData = await response;
  }

  Future<void> insertData() async {
    if (allData.isEmpty) {
      // ignore: unused_local_variable
      var response = mySqlDb.insertData('shareds');
    } else {}
  }
}
