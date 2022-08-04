import 'package:flutter/material.dart';
import 'package:flutter_app_todo_c6_alex/home/home_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),
      },
      theme: ThemeData.light(),

      initialRoute: HomeScreen.routeName,
    );
  }
}
