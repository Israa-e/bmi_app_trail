import 'package:bmi_app_trail/home.dart';
import 'package:flutter/material.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.teal,
          canvasColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white),
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
            headline2: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ), headline3: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          )),
      home:const
      // SingleChildScrollView(
      //   padding: EdgeInsets.all(5),
      //   child:
        MyHomePage(),
      // ),
    );
  }
}
