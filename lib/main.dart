import 'package:flutter/material.dart';
import 'package:flutter_calculator/button.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

var userAnswer = '';
var userInput = '';

final List<String> button = [
  'C',
  'DEL',
  '%',
  '/',
  '9',
  '8',
  '7',
  'X',
  '6',
  '5',
  '4',
  '-',
  '3',
  '2',
  '1',
  '+',
  '0',
  ',',
  'ANS',
  '=',
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          userInput,
                          style: TextStyle(fontSize: 38),
                        )),
                    Container(
                        alignment: Alignment.centerRight,
                        child: Text(userAnswer, style: TextStyle(fontSize: 40)))
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
                color: Colors.deepPurple.shade200,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: GridView.builder(
                      itemCount: button.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4),
                      itemBuilder: (BuildContext context, int index) {
                        //CLEAR BUTTON
                        if (index == 0) {
                          return MyButton(
                              buttonTapped: () {
                                setState(() {
                                  userInput = '';
                                });
                              },
                              btnTetxt: button[index],
                              btnColor: Colors.green.shade200,
                              txtColor: Colors.white);
                          //DELETE BUTTON
                        } else if (index == 1) {
                          return MyButton(
                              buttonTapped: () {
                                setState(() {
                                  userInput = userInput.substring(
                                      0, userInput.length - 1);
                                });
                              },
                              btnTetxt: button[index],
                              btnColor: Colors.red.shade200,
                              txtColor: Colors.white);

                          //EQUAL BUTTON
                        } else if (index == button.length - 1) {
                          return MyButton(
                              buttonTapped: () {
                                setState(() {
                                  equalButtonPressed();
                                });
                              },
                              btnTetxt: button[index],
                              btnColor: Colors.deepPurple.shade100,
                              txtColor: Colors.white);
                        } else {
                          return MyButton(
                            buttonTapped: () {
                              setState(() {
                                userInput = userInput + button[index];
                              });
                            },
                            btnTetxt: button[index],
                            btnColor: isOperator(button[index])
                                ? Colors.deepPurple.shade100
                                : Colors.deepPurple.shade50,
                            txtColor: isOperator(button[index])
                                ? Colors.white
                                : Colors.deepPurple.shade300,
                          );
                        }
                      }),
                )),
          )
        ],
      ),
    );
  }
}

bool isOperator(String x) {
  if (x == '*' || x == '/' || x == 'X' || x == '+' || x == '-' || x == '=') {
    return true;
  }
  return false;
}

void equalButtonPressed() {
  String finalQuestion = userInput;

  finalQuestion = finalQuestion.replaceAll('X', '*');

  Parser p = Parser();
  Expression exp = p.parse(finalQuestion);

  ContextModel cm = ContextModel();

  double eval = exp.evaluate(EvaluationType.REAL, cm);

  userAnswer = eval.toString();
}
