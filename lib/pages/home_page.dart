import 'package:flutter/material.dart';
import 'package:todo_hiver/utils/todo_tile.dart';
class HomePage extends StatefulWidget{
  const HomePage ({super.key});
  @override 
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{

  //list of the todo List
  List toDoList = [
    ["Make Brekfast", true],
    ["Make Lunch", false],
    
  ];

  //checkBoxChanged Function and int is used to track the specific task
  void checkBoxChanged(bool? value, int index){
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
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

      //using a dynamic listview
      body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
              taskName: toDoList[index][0], 
              taskCompleted: toDoList[index][1], 
              onChanged:(value) => checkBoxChanged(value, index)
            );
          },

        ),
      );
    }
}
