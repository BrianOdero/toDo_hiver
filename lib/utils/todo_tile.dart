import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext?)? deleteNote;
  

  const TodoTile({
    super.key, 
    required this.taskName, 
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteNote
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: 
        Slidable(
          //can describe start action pane and end action pane
          endActionPane: ActionPane(
            motion: StretchMotion(), 
            children: [ SlidableAction(
              onPressed: deleteNote,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
            )]),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(12)
              ),
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                //checkbox
                Checkbox(
                  value: taskCompleted, 
                  onChanged: onChanged,
                  activeColor: Colors.red,),
                //taskname
                Text(
                  taskName,
                  //style for crossing the task across if completed
                  style: TextStyle(
                    decoration: taskCompleted ? TextDecoration.lineThrough 
                    : TextDecoration.none,
                  )
                ),
              ],
            ),
          ),
        ),
    );
  }
}