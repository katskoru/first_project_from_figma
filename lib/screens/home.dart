import 'package:flutter/material.dart';
import 'package:project_from_figma/screens/AnimatedContainer.dart';
import 'package:project_from_figma/screens/ToDoApp.dart';
import 'package:project_from_figma/screens/calculator.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> screens = [
    MyAnCont(),
    CalcPage(),
    DoPage(),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: 20.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              color: Colors.grey,
              width: double.infinity,
              child: Row(
                children: const [
                  Icon(
                    Icons.home,
                    size: 48.0,
                    color: Colors.red,
                  ),
                  Text(
                    "Home",
                    style: TextStyle(fontSize: 48.0),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.grey,
              width: double.infinity,
              child: Row(
                children: const [
                  Icon(
                    Icons.search,
                    size: 48.0,
                  ),
                  Text(
                    "Calculator",
                    style: TextStyle(fontSize: 48.0),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.grey,
              width: double.infinity,
              child: Row(
                children: const [
                  Icon(
                    Icons.check,
                    size: 48.0,
                  ),
                  Text(
                    "ToDoApp",
                    style: TextStyle(fontSize: 48.0),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                iconSize: 68.0,
                icon: const Icon(Icons.home),
                color: Colors.red,
                onPressed: () {
                  setState(() {
                    index = 0;
                  });
                }),
            IconButton(
              iconSize: 68.0,
              icon: const Icon(Icons.search),
              onPressed: () {
                setState(() {
                  index = 1;
                });
              },
            ),
            IconButton(
              iconSize: 68.0,
              icon: const Icon(Icons.check),
              onPressed: () {
                setState(() {
                  index = 2;
                });
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Center(
          child: Text(
            "My New App",
            style: TextStyle(fontSize: 40.0),
          ),
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.grey,
        iconTheme: const IconThemeData(size: 38.0),
      ),
      body: screens[index],
    );
  }
}
