import 'dart:math';

import 'package:flutter/material.dart';

class MyAnCont extends StatefulWidget {
  MyAnCont({Key? key}) : super(key: key);

  @override
  State<MyAnCont> createState() => _MyAnContState();
}

class _MyAnContState extends State<MyAnCont> {
  bool _isInitialValue = true;
  var width = Random().nextInt(500);
  var height = Random().nextInt(500);
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
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            color: list_of_colors[index1],
            width: width.toDouble(),
            height: height.toDouble(),
          ),
          SizedBox(
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
                    width = Random().nextInt(500);
                    height = Random().nextInt(500);
                    index1 = Random().nextInt(list_of_colors.length - 1);
                  });
                }),
          )
        ],
      ),
    );
  }
}
