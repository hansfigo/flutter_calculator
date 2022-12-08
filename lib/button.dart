import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final btnColor;
  final txtColor;
  final String? btnTetxt;
  final buttonTapped;

  MyButton({this.btnColor, this.btnTetxt, this.txtColor, this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: GestureDetector(
        onTap: buttonTapped,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              color: btnColor,
              child: Center(
                child: Text(
                  btnTetxt!,
                  style: TextStyle(color: txtColor, fontSize: 40, fontWeight: FontWeight.w400),
                ),
              ),
            )),
      ),
    );
  }
}

class MybuttonLong extends StatelessWidget {
  final btnColor;
  final txtColor;
  final String? btnTetxt;
  final buttonTapped;

  MybuttonLong({this.btnColor, this.btnTetxt, this.txtColor, this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: GestureDetector(
        onTap: buttonTapped,
        child: Container(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                color: btnColor,
                child: Center(
                  child: Text(
                    btnTetxt!,
                    style: TextStyle(color: txtColor, fontSize: 40, fontWeight: FontWeight.w400),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}