import 'package:flutter/material.dart';
import 'package:project_from_figma/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        unselectedWidgetColor: Colors.black,
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
