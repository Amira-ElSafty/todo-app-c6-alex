import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_todo_c6_alex/home/task_item.dart';
import 'package:flutter_app_todo_c6_alex/home/task_tab_list.dart';
import 'package:flutter_app_todo_c6_alex/my_theme.dart';
import 'package:flutter_app_todo_c6_alex/setting/setting_tab.dart';

import 'add_task_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemeData.background,
      appBar: AppBar(
        centerTitle: true,
        title: Text('ToDo App',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: MyThemeData.white
          ),

        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index){
            currentIndex = index ;
            setState(() {

            });
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.list),
              label: 'Tasks'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings'
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showAddTaskBottomSheet();
        },
        shape: StadiumBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.onPrimary,
              width: 4,
            ),
        ),
        child: Icon(Icons.add),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: tabList[currentIndex],
    );
  }
  List<Widget> tabList = [
    TaskTabList() ,
    SettingTab()
  ];

  void showAddTaskBottomSheet() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        context: context,
        builder: (context){
          return AddTaskBottomSheet();
        });
  }
}
