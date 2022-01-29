import 'dart:math';

import 'package:flutter/material.dart';

class MyAnCont extends StatefulWidget {
  MyAnCont({Key? key}) : super(key: key);

  @override
  State<MyAnCont> createState() => _MyAnContState();
}

class _MyAnContState extends State<MyAnCont> {
  bool _isInitialValue = true;
  var width = Random().nextInt(100);
  var height = Random().nextInt(100);
  List list_of_colors = [
    Colors.blue,
    Colors.amber,
    Colors.red,
    Colors.green,
    Colors.orange,
  ];
  int index1 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.grey,
              width: double.infinity,
              height: 79.0,
              child: Icon(
                Icons.menu,
                size: 68.0,
              ),
            ),
            Align(
              alignment: Alignment.center,
            ),
            Container(
              height: 30.0,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              color: list_of_colors[index1],
              width: width.toDouble(),
              height: height.toDouble(),
            ),
            Container(
              height: 10.0,
            ),
            Container(
              height: 70.0,
              width: 200.0,
              child: ElevatedButton(
                  child: Text("Click me"),
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    shadowColor: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isInitialValue = !_isInitialValue;
                      width = Random().nextInt(300);
                      height = Random().nextInt(300);
                      index1 = Random().nextInt(list_of_colors.length - 1);
                    });
                  }),
            )
          ],
        ),
      ),
    );
  }
}
