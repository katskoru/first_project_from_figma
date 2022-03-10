import 'package:flutter/material.dart';
import 'package:project_from_figma/Widgets/text_widget.dart';
import 'package:project_from_figma/screens/home.dart';

import 'package:project_from_figma/screens/calculator.dart';

class DoPage extends StatefulWidget {
  DoPage({Key? key}) : super(key: key);

  @override
  State<DoPage> createState() => _DoPageState();
}

class _DoPageState extends State<DoPage> {
  List<Map> my_tasks = [];

  int index = 0;
  @override
  void initState() {
    super.initState();
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        centerTitle: true,
        title: MyTextWidget(
          text: "ToDoApp",
        ),
        leading: const Icon(Icons.list_alt_outlined),
        actions: [
          my_add_button(),
        ],
      ),
      body: Container(
        height: 300,
        child: ListView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: TextFormField(
                      obscureText: false,
                      style: const TextStyle(
                          color: Colors.white70, fontSize: 20.0),
                      textInputAction: TextInputAction.newline,
                      cursorHeight: 30.0,
                      cursorColor: Colors.white70,
                      controller: controller,
                      minLines: 1,
                      maxLines: 4,
                      keyboardType: TextInputType.multiline,
                      autofocus: false,
                      decoration: InputDecoration(
                        prefix: my_add_button(),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width - 12.0,
                  height: 70.0,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(
                        color: Colors.white70,
                        width: 5.0,
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: my_tasks.length,
                  itemBuilder: (context, index) {
                    return myTask(index);
                  }),
            )
          ],
        ),
      ),
    );
  }

  IconButton my_add_button() {
    return IconButton(
      iconSize: 30.0,
      color: Colors.white70,
      onPressed: () {
        Map new_map = {};
        // var sortedMap = Map.fromEntries(new_map.entries.toList()
        //   ..sort((e1, e2) => e1.value.compareTo(e2.value)));
        new_map["checkbox"] = false;
        new_map["tekst"] = controller.text;
        setState(() {
          my_tasks.add(new_map);
          controller.clear();
          my_tasks.sort((a, b) => ((a["checkbox"]).toString())
              .compareTo((b["checkbox"]).toString()));
        });
      },
      icon: Icon(Icons.add),
    );
  }

  Widget myTask(index) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (kierunkowy) {
        if (kierunkowy == DismissDirection.startToEnd ||
            kierunkowy == DismissDirection.endToStart) my_tasks.removeAt(index);
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  value: my_tasks[index].values.elementAt(0),
                  onChanged: (isChecked) {
                    setState(() {
                      bool mybool = my_tasks[index].values.elementAt(0);
                      my_tasks[index]["checkbox"] = !mybool;
                      my_tasks.sort((a, b) => ((a["checkbox"]).toString())
                          .compareTo((b["checkbox"]).toString()));
                    });
                  }),
              Flexible(
                child: MyTextWidget(
                  text: my_tasks[index].values.elementAt(1).toString(),
                  color: Colors.white70,
                  size: 20.0,
                  decor: my_tasks[index].values.elementAt(0)
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.white70,
            thickness: 2.0,
          )
        ],
      ),
    );
  }
}
