import 'package:flutter/material.dart';
import 'package:to_do_list/constants/app_colors.dart';
import 'package:to_do_list/constants/app_icons.dart';

class SearchField extends StatefulWidget {
  final String hintText;
  final ValueChanged<String> onChanged;

  const SearchField(
      {super.key, required this.hintText, required this.onChanged});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      style: TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
      decoration: InputDecoration(
        fillColor: AppColors.hex181818,
        filled: true,
        hintText: widget.hintText,
        hintStyle:
            TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 16),
        prefixIcon: SizedBox(
          width: 0,
          child: Center(
            child: Image.asset(
              AppIcons.search,
              height: 18,
              width: 18,
            ),
          ),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
      ),
    );
  }
}
