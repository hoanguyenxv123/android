import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String level;
  final Color color;
  final bool isCheck;
  final VoidCallback onTap;

  const PrimaryButton({super.key,
    required this.level,
    required this.color,
    required this.isCheck,
    required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: MediaQuery
            .of(context)
            .size
            .width * 0.27,
        child: Center(
          child: Text(level, style: TextStyle(
              color: (isCheck == true) ? Colors.black : Colors.white,
              fontSize: 20
          ),),
        ),
        decoration: BoxDecoration(
            color: (isCheck == true) ? color : Colors.black,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: color,
                width: 2
            )
        ),
      ),
    );
  }
}
