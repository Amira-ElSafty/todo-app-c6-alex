import 'package:flutter/material.dart';
import 'package:flutter_app_todo_c6_alex/my_theme.dart';

class TaskItem extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  Text('Todo List',
                    style: TextStyle(
                      fontSize: 20,
                      color: MyThemeData.primaryBlue,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text('10:30',
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
    );
  }
}
