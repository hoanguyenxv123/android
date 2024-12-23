import 'package:flutter/material.dart';

class TextData extends StatelessWidget {
  final String? hintText;
  final String initialValue;
  final bool isMultiline;
  final double? height;

  const TextData(
      {super.key,
      required this.hintText,
      this.isMultiline = false,
      this.height, this.initialValue=''});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 60,
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
          color: Color(0xFF181818), borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        style: TextStyle(color: Colors.white, fontSize: 16),
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.white70, fontSize: 16),
            border: InputBorder.none),
        maxLines: isMultiline ? null : 1,
        minLines: 1,
        initialValue: initialValue,
      ),
    );
  }
}
