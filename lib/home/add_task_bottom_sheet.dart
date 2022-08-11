import 'package:flutter/material.dart';
import 'package:flutter_app_todo_c6_alex/firebase_utils/firebase_utils.dart';
import 'package:flutter_app_todo_c6_alex/model/task.dart';
import 'package:flutter_app_todo_c6_alex/my_theme.dart';
import 'package:flutter_app_todo_c6_alex/utils/utils.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  String title = '';

  String description = '';

  DateTime selectedDate = DateTime.now();

  var formKey = GlobalKey<FormState>();

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
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Enter your title',
                      labelStyle:
                          TextStyle(fontSize: 15, color: MyThemeData.black)),
                  onChanged: (text){
                    title = text ;
                    setState(() {

                    });

                  },
                  validator: (text){
                    if(text == null || text.isEmpty){
                      return 'Please enter Your title';
                    }
                    return null ;
                  },
                ),
                TextFormField(
                  maxLines: 5,
                  minLines: 5,
                  validator: (text){
                    if(text == null || text.isEmpty){
                      return 'Please enter Your description';
                    }
                    return null ;
                  },
                  onChanged: (text){
                    description = text;
                    setState(() {

                    });
                  },
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
                InkWell(
                  onTap: (){
                    chooseDate();
                  },
                  child: Text(
                    '${selectedDate.month}/${selectedDate.day}/${selectedDate.year}'
                    ,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    onPressed: () {
                      addTask();
                    },
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

  void chooseDate()async{
   var chooseDate = await showDatePicker(
       context: context,
       initialDate: DateTime.now(),
       firstDate: DateTime.now(),
       lastDate: DateTime.now().add(Duration(days: 365)));
   if(chooseDate != null){
     selectedDate = chooseDate;
     setState(() {

     });
   }
  }

  void addTask() {
    if(formKey.currentState!.validate()){
      Task task = Task(
          title: title,
          description: description,
          date: selectedDate.millisecondsSinceEpoch
      );
      // showLoading(context, 'Loading ...');
      addTaskToFirebase(task).timeout(Duration(milliseconds: 500),onTimeout: (){
        print('todo was added successfully');
        showMessage(context, 'Todo was added successfully', 'OK', (context){
          Navigator.pop(context);
          Navigator.pop(context);
        });
        // hideLoading(context);
      });
      // show loading
      // addTaskToFirebase(task).then((value){
      //
      //   print('successfully');
      //   // hideLoading(context);
      //   showMessage(context, 'Task was added successfully', 'OK', (context){
      //     Navigator.pop(context);
      //   });
      //   // hide loading
      //   // show message task was added
      // }).catchError((error, stackTrace){
      //   hideLoading(context);
      //   print('onError: $error');
        // showMessage(context, 'something went wrong', 'OK', (){
        //   Navigator.pop(context);
        // });
        // hide loading
        // show message error
      // }).timeout(Duration(milliseconds: 50000),onTimeout: (){
      //   print('todo added');
      //   hideLoading(context);
      //   showMessage(context, 'Task was added successfully', 'OK',(context){
      //     print('exit');
      //     Navigator.pop(context);
          // if (mounted) {
          //   setState(() {
          //     Navigator.pop(context);
          //   });
          // }

    }
  }
}
