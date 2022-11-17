import 'package:flutter/material.dart';
import 'package:flutter_calculator/button.dart';

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

var userAnswer = 'X' ;
var userInput = 'X';

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
                      child: Text(userAnswer, style: TextStyle(fontSize: 20),)),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text(userInput, style: TextStyle(fontSize: 20)))
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
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: GridView.builder(
                    itemCount: button.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (BuildContext context, int index) {
                     if (index == 0) {
                       return MyButton(
                        btnTetxt: button[index],
                        btnColor: Colors.green.shade200,
                        txtColor: Colors.white
                      );
                     }else if(index == 1) {
                      return MyButton(
                        btnTetxt: button[index],
                        btnColor: Colors.red.shade200,
                        txtColor: Colors.white
                      );
                     } else {
                       return MyButton(
                        btnTetxt: button[index],
                        btnColor: isOperator(button[index]) ? Colors.deepPurple.shade100 : Colors.deepPurple.shade50 ,
                        txtColor: isOperator(button[index]) ? Colors.white : Colors.deepPurple.shade300 ,
                      );
                     }
                    }),
              )
            ),
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
