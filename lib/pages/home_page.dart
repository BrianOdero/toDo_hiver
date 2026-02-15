import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_hiver/data/database.dart';
import 'package:todo_hiver/utils/dialog_box.dart';
import 'package:todo_hiver/utils/todo_tile.dart';
class HomePage extends StatefulWidget{
  const HomePage ({super.key});
  @override 
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{

  //referencing the hive databaase
  final mybox = Hive.box("mybox");

  //instantiating the database
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    // if its the first time creating the app then create default data
    if(mybox.get("TODOLIST") == null){
      db.createInitialData();
    }
    else{
    //There already exists data
      db.loadData();
    }



    super.initState();
  }



  //checkBoxChanged Function and int is used to track the specific task
  void checkBoxChanged(bool? value, int index){
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  final controller = TextEditingController();

  //function to save the task to hiver
  void saveNewTask(){
    //adding the task to the list
    setState(() {
      db.toDoList.add([controller.text, false]);
      controller.clear();//clearing the input field
    });
    //exit the dialog box after adding a new task
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  //function to createNewTask using dialog box
  void createNewTask(){
    //show dialog box
    showDialog(
      context: context, 
      builder: (context){
        return DialogBox(
          controller: controller,
          onSave: saveNewTask,
          onCancel:() => Navigator.of(context).pop(),//Dismisses what is in the input field
        );
      });
  }

  //function to delete task
  void deleteTask(int index){
    //delete task from list
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  

  @override
  Widget build(BuildContext contect){
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text("To Do App"),
        titleTextStyle: TextStyle(color: Colors.white),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),

      //Adding the floating icon to add texts
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
       
      //using a dynamic listview
      body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
              taskName: db.toDoList[index][0], 
              taskCompleted: db.toDoList[index][1], 
              onChanged:(value) => checkBoxChanged(value, index),
              deleteNote:(context) => deleteTask,
            );
          },

        ),
      );
    }
}

//Using hard coded value for list view viewage

 // body: ListView(
        //   children: [
        //     TodoTile(
        //       taskName: "Maker Of Dreams",
        //       taskCompleted: true,
        //       onChanged:(p0) {},
        //     ),
        //     TodoTile(
        //       taskName: "Maker Of Dreams",
        //       taskCompleted: true,
        //       onChanged:(p0) {},
        //     ),
        //   ],
        // ),
