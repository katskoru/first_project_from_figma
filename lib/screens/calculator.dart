import 'package:project_from_figma/Widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:math_expressions/math_expressions.dart';

class CalcPage extends StatefulWidget {
  CalcPage({Key? key}) : super(key: key);

  @override
  State<CalcPage> createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {
  String? equation;

  String? sum;

  @override
  void initState() {
    super.initState();
    equation = "";
    sum = "0";
  }

  List listOfButtons = [
    Row(
      children: [
        const Icon(
          TablerIcons.plus,
          size: 20.0,
          color: Colors.black,
        ),
        MyTextWidget(
          size: 20.0,
          color: Colors.black,
          text: "/",
        ),
        const Icon(
          TablerIcons.minus,
          size: 20.0,
          color: Colors.black,
        ),
      ],
    ),
    "0",
    ".",
    const Icon(
      TablerIcons.equal,
      size: 20.0,
      color: Colors.black,
    ),
    "1",
    "2",
    "3",
    "+",
    "4",
    "5",
    "6",
    "-",
    "7",
    "8",
    "9",
    "x",
    "CE",
    "C",
    const Icon(
      TablerIcons.backspace,
      size: 20.0,
      color: Colors.black,
    ),
    "/",
    const Icon(
      TablerIcons.percentage,
      size: 20.0,
      color: Colors.black,
    ),
    const Icon(
      TablerIcons.square_root,
      size: 20.0,
      color: Colors.black,
    ),
    const Icon(
      TablerIcons.superscript,
      size: 20.0,
      color: Colors.black,
    ),
    "1/x",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[50],
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: ListView(
                // wyśrodkowuje, warto stosować
                shrinkWrap: true,
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Center(
                      child: Container(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width - 16,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        MyTextWidget(
                          text: equation,
                          color: Colors.grey[600],
                          size: 20.0,
                        ),
                      ],
                    ),
                  )),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MyTextWidget(
                        text: sum,
                        color: Colors.black,
                        size: 30.0,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1.5,
                  ),
                  // Container(
                  //   width: 250.0,
                  //   height: 100.0,
                  //   child: ListView.builder(
                  //       scrollDirection: Axis.horizontal,
                  //       shrinkWrap: true,
                  //       itemCount: 4,
                  //       itemBuilder: (ctxt, index) {
                  //         return myButton(functionButtons[index], () {});
                  //       }),
                  // ),
                  GridView.builder(
                      // definicja w jaki sposób mamy scrollować:
                      // powoduje, że lista w liście nie będzie się scrollować:
                      physics: const NeverScrollableScrollPhysics(),
                      reverse: true,
                      shrinkWrap: true,
                      itemCount: listOfButtons.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 1.2,
                      ),
                      itemBuilder: (contx, index) {
                        return myButton(listOfButtons[index], () {
                          if (listOfButtons[index] is String &&
                              listOfButtons[index] != 'CE' &&
                              listOfButtons[index] != 'C' &&
                              listOfButtons[index] != '1/x') {
                            // if (int.tryParse(listOfButtons[index]) is int) {
                            // setState odświeża render:
                            setState(() {
                              equation = equation! + listOfButtons[index];
                            });

                            // }
                          }
                          if (listOfButtons[index] is String &&
                                  listOfButtons[index] == "C" ||
                              listOfButtons[index] == "CE") {
                            setState(() {
                              equation = " ";
                              sum = "0";
                            });

                            // setState odświeża render:

                          }

                          if (listOfButtons[index] is Icon) {
                            Icon icon = listOfButtons[index];

                            if (icon.icon == TablerIcons.backspace) {
                              setState(() {
                                equation = equation!
                                    .substring(0, equation!.length - 1);
                              });
                            } else if (icon.icon == TablerIcons.equal) {
                              sumFunction(equation!);
                            } else if (icon.icon == TablerIcons.percentage) {
                              setState(() {
                                equation = '($equation)/100';
                              });
                            } else if (icon.icon == TablerIcons.square_root) {
                              setState(() {
                                equation = "√($equation)";
                              });
                            } else if (icon.icon == TablerIcons.superscript) {
                              setState(() {
                                equation = "($equation)^2";
                              });
                            }
                          }
                          if (index == listOfButtons.length - 1) {
                            setState(() {
                              equation = '($equation)^(-1)';
                            });
                          }
                          if (index == 0) {
                            sum!.startsWith('-')
                                ? sum = sum!.replaceFirst('-', '')
                                : sum = '-' + sum!;
                          }
                        },
                            index >= listOfButtons.length - 4
                                ? Colors.white
                                : null);
                      })
                ]),
          ),
        ));
  }

  sumFunction(String userInput) {
    Parser p = Parser();
    String input = userInput.replaceAll('x', '*');

    if (userInput.contains('√')) {
      input = input.replaceAll('√', '');
      input = input + '^(1/2)';
    }

    Expression exp = p.parse(input);

    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      sum = eval.toStringAsFixed(2);
    });
  }

  Widget myButton(
    buttonContent,
    function,
    color,
  ) {
    color = color == null ? Colors.blueGrey[50] : color;
    return MaterialButton(
        elevation: 1.0,
        color: color,
        child: (buttonContent is String)
            ? MyTextWidget(
                color: Colors.black,
                size: 25.0,
                text: buttonContent,
              )
            : buttonContent,
        onPressed: function);
  }
}
