import 'package:flutter/material.dart';
import 'package:todo_hiver/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  const DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: 
        SizedBox(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //get user input
              TextField(
                //accessing the text field will require use of a controller
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Add A new TAsk"
                ),
              ),

              //buttons: Save and cancel button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //save button
                  MyButton(text: "Save", onPressed:onSave,),
                  //cancel button
                  MyButton(text: "Cancel", onPressed:onCancel,)
                ],
              )

            ],
            
          ),
        ),
    );
  }
}