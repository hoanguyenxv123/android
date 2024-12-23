import 'package:flutter/material.dart';

class SecondButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const SecondButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFFBA83DE),
              Color(0xFFCD83C6),
              Color(0xFFDE83B0),
            ],
            ),
            borderRadius: BorderRadius.circular(8)
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
