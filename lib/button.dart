import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final btnColor;
  final txtColor;
  final String? btnTetxt;

  MyButton({this.btnColor, this.btnTetxt, this.txtColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: btnColor,
              child: Center(
                child: Text(
                  btnTetxt!,
                  style: TextStyle(color: txtColor, fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            )),
      ),
    );
  }
}
