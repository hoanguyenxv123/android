import 'package:flutter/material.dart';
import 'package:to_do_list/constants/app_colors.dart';

class TextData extends StatelessWidget {
  final String? hintText;
  final bool isMultiline;
  final double? height;
  final TextEditingController controller;

  const TextData({
    super.key,
    required this.hintText,
    this.isMultiline = false,
    this.height,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 60,
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Color(0xFF181818),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: AppColors.hexFAD9FF),
      ),
      child: TextFormField(
        controller: controller, // Sử dụng controller thay vì initialValue
        style: TextStyle(color: Colors.white, fontSize: 16),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white70, fontSize: 16),
          border: InputBorder.none,
        ),
        maxLines: isMultiline ? null : 1,
        minLines: 1,
      ),
    );
  }
}
