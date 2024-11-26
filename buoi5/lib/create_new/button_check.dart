import 'package:flutter/material.dart';

class ButtonCheck extends StatefulWidget {
  const ButtonCheck({super.key});

  @override
  State<ButtonCheck> createState() => _ButtonCheckState();
}

class _ButtonCheckState extends State<ButtonCheck> {
  late bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          isChecked=!isChecked;
        });
      },
      child: Container(
        height: 24,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:(isChecked==true)? Color(0xFFA378FF):Colors.white,
        ),
        child: Stack(
          children: [
            Align(
              alignment: (isChecked==true)
                  ? Alignment.centerRight
                  :Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.all(2),
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:(isChecked==true)? Colors.white:Color(0xFFA378FF),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
