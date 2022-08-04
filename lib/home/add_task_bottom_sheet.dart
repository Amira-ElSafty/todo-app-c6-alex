import 'package:flutter/material.dart';
import 'package:flutter_app_todo_c6_alex/my_theme.dart';

class AddTaskBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
      ),
      padding: EdgeInsets.all(12),
      // margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            'Add New Task',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: MyThemeData.black),
          ),
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Enter your task',
                      labelStyle:
                          TextStyle(fontSize: 15, color: MyThemeData.black)),
                ),
                TextFormField(
                  maxLines: 5,
                  minLines: 5,
                  decoration: InputDecoration(
                      labelText: 'Description',
                      labelStyle:
                          TextStyle(fontSize: 15, color: MyThemeData.black)),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Select Date',
                  style: TextStyle(
                      color: MyThemeData.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '12/2/2022',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Add',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
