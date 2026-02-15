import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  //create an empty list for storing the data
  List toDoList = [];
  // reference the box as we did in homepage
  final mybox = Hive.box("mybox");

  //run this if its the first time opening the app
  void createInitialData(){
    toDoList = [
      ["Make tutorials", false],
      ["Make food", true]
    ];
  }

  //load the data from the database
  void loadData(){
    toDoList = mybox.get("TODOLIST");
  }

  //function to update the database
  void updateDataBase(){
    mybox.put("TODOLIST", toDoList);
  }
}