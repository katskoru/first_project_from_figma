import 'dart:math';

import 'package:flutter/material.dart';

class MyAnCont extends StatefulWidget {
  MyAnCont({Key? key}) : super(key: key);

  @override
  State<MyAnCont> createState() => _MyAnContState();
}

bool _isInitialValue = true;

class _MyAnContState extends State<MyAnCont> {
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
            Align(
              alignment: Alignment.center,
            ),
            Container(
              height: 20.0,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              color: list_of_colors[index1],
              width: width.toDouble(),
              height: height.toDouble(),
            ),
            Container(
              height: 20.0,
            ),
            Container(
              height: 70.0,
              width: 200.0,
              child: ElevatedButton(
                  child: Text("Click me"),
                  style: ElevatedButton.styleFrom(
                      primary: _isInitialValue ? Colors.green : Colors.blue,
                      shape: StadiumBorder(),
                      shadowColor: Colors.grey[900],
                      elevation: 10.0),
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
