import 'package:hive/hive.dart';

class DataBase {
  //Referencing Hive
  var myBox = Hive.box("myBox");

  List toDoList = [];

  ///Run this Method if user is first time ever opening the App
   CreateInitialData() {
    toDoList = [
      ["Do Exercise", false],
      ["Read Novels", false],
    ];
  }


  ///Load the Date
   LoadData() {
    toDoList = myBox.get("TodoList");

  }

  ///Update the Data
   UpdateData() {
     myBox.put("TodoList", toDoList);
    
  }
}
