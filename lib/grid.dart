import 'package:flutter/material.dart';
import 'package:flutter_calculator/button.dart';
import 'package:flutter_calculator/main.dart';
import 'package:math_expressions/math_expressions.dart';

class gridViewButton extends StatefulWidget {

  @override
  State<gridViewButton> createState() => _gridViewButtonState();
}

class _gridViewButtonState extends State<gridViewButton> {

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
  '=',
];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
                      itemCount: button.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
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
                          return MybuttonLong(
                              buttonTapped: () {
                                setState(() {
                                  equalButtonPressed();
                                });
                              },
                              btnTetxt: button[index],
                              btnColor: Colors.deepPurple.shade100,
                              txtColor: Colors.white);
                          //PLUS BTN    //
                        } else if (index == button.length - 4) {
                          return Container(
                            child: MybuttonLong(
                                buttonTapped: () {
                                  setState(() {
                                    userInput = userInput + button[index];
                                  });
                                },
                                btnTetxt: button[index],
                                btnColor: Colors.deepPurple.shade300,
                                txtColor: Colors.white),
                          );
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
                      });
  }
}