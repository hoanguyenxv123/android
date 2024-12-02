import 'package:flutter/material.dart';

class PrimaryTitle extends StatelessWidget {
  final String title;
  const PrimaryTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 20),
    );
  }
}
