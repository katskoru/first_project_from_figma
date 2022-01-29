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
        child: ListView(
          children: [
            SizedBox(
              height: 75.0,
              child: ListTile(
                tileColor: Colors.grey,
                leading: const Icon(
                  Icons.home,
                  color: Colors.red,
                  size: 68.0,
                ),
                title: const Text('Home'),
                onTap: () {
                  setState(() => index = 0);
                  Navigator.of(context).pop();
                },
              ),
            ),
            const Divider(
              height: 40.0,
            ),
            SizedBox(
              height: 75.0,
              child: ListTile(
                tileColor: Colors.grey,
                leading: const Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 68.0,
                ),
                title: const Text('Calculator'),
                onTap: () {
                  setState(() => index = 1);
                  Navigator.of(context).pop();
                },
              ),
            ),
            const Divider(
              height: 40.0,
            ),
            SizedBox(
              height: 75.0,
              child: ListTile(
                tileColor: Colors.grey,
                leading: const Icon(
                  Icons.check,
                  color: Colors.black,
                  size: 68.0,
                ),
                title: const Text('ToDoApp'),
                onTap: () {
                  setState(() => index = 2);
                  Navigator.of(context).pop();
                },
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
