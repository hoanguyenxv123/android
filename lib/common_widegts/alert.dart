import 'package:flutter/material.dart';

class Alert extends StatefulWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  const Alert({super.key, this.isChecked = true, required this.onChanged});

  @override
  State<Alert> createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onChanged(_isChecked);
    });
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked; // Toggle the local state
        });
      },
      child: Container(
        height: 24,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: _isChecked ? Color(0xFFA378FF) : Colors.transparent, // Default color when unchecked
          border: Border.all(
            color: Color(0xFFA378FF),
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: _isChecked ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.all(2),
                height: 20,
                width: 18,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}