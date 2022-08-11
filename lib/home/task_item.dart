import 'package:flutter/material.dart';
import 'package:flutter_app_todo_c6_alex/model/task.dart';
import 'package:flutter_app_todo_c6_alex/my_theme.dart';
import 'package:flutter_app_todo_c6_alex/provider/list_provider.dart';
import 'package:flutter_app_todo_c6_alex/utils/utils.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../firebase_utils/firebase_utils.dart';

class TaskItem extends StatelessWidget{
  Task task ;
  late ListProvider listProvider ;
  TaskItem({required this.task});
  @override
  Widget build(BuildContext context) {
    listProvider = Provider.of<ListProvider>(context);
    return Slidable(
      startActionPane: ActionPane(
        extentRatio: 0.25,
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),
        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: (context){
              deleteTaskFromFireStore(task).timeout(Duration(milliseconds: 500),onTimeout: (){
                print('task was deleted');
                listProvider.getTaskFromFireStore();
                // print('task was deleted');
                showMessage(context, 'Task was deleted successfully', 'OK', (context){
                  Navigator.pop(context);
                });
              });
            },
            backgroundColor: MyThemeData.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.all(18),
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: MyThemeData.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              color: MyThemeData.primaryBlue,
              height: 80,
              width: 3,
            ),
            SizedBox(width: 15,),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(task.title,
                      style: TextStyle(
                        fontSize: 20,
                        color: MyThemeData.primaryBlue,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(task.description,
                      style: TextStyle(
                          fontSize: 20,
                          color: MyThemeData.black,
                          fontWeight: FontWeight.w400
                      ),
                    ),

                  ],
                )
            )
            ,
            Container(
              padding:EdgeInsets.symmetric(vertical: 8,horizontal: 20) ,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: MyThemeData.primaryBlue
              ),
              child: Icon(Icons.check ,color: MyThemeData.white),
            )
          ],
        ),
      ),
    );
  }
}
