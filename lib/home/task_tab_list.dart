import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_todo_c6_alex/home/task_item.dart';
import 'package:flutter_app_todo_c6_alex/my_theme.dart';
import 'package:flutter_app_todo_c6_alex/provider/list_provider.dart';
import 'package:provider/provider.dart';

import '../firebase_utils/firebase_utils.dart';
import '../model/task.dart';

class TaskTabList extends StatefulWidget{
  @override
  State<TaskTabList> createState() => _TaskTabListState();
}

class _TaskTabListState extends State<TaskTabList> {
  late ListProvider listProvider ;
  @override
  Widget build(BuildContext context) {
    listProvider = Provider.of<ListProvider>(context);
      listProvider.getTaskFromFireStore();

    return Column(
      children: [
        CalendarTimeline(
          initialDate: listProvider.selectedDate,
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) {
            listProvider.changeSelectedDate(date);
          },
          leftMargin: 20,
          monthColor: MyThemeData.primaryBlue,
          dayColor: MyThemeData.black,
          activeDayColor: Colors.white,
          activeBackgroundDayColor:MyThemeData.primaryBlue,
          dotsColor: Color(0xFF333A47),
          locale: 'en_ISO',
        ),
        Expanded(
            child:ListView.builder(
                itemCount: listProvider.taskList.length,
                itemBuilder: (context,index){
                  return TaskItem(task:listProvider.taskList[index] ,);
                }
            )
        ),
      ],
    );
  }

}

/*

 */