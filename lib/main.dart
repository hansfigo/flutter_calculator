import 'package:flutter/material.dart';
import 'package:flutter_calculator/button.dart';
import 'package:flutter_calculator/grid.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: HomePage());
  }
}


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

var userAnswer = '';
var userInput = '';

final gridViewButton gridButton = new gridViewButton();

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
                  child: gridButton
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
