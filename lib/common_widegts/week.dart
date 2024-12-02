import 'package:flutter/material.dart';
class Week extends StatefulWidget {
  final int dayOfMonth;
  final String dayOfWeek;
  final Function(int) onDaySelected;
  final bool isSelected;

  Week({
    required this.dayOfMonth,
    required this.dayOfWeek,
    required this.onDaySelected,
    this.isSelected = false,
    super.key,
  });

  @override
  State<Week> createState() => _WeekState();
}

class _WeekState extends State<Week> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: MediaQuery
          .of(context)
          .size
          .width * (0.12),
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: widget.isSelected ? Border.all(
            color: Color(0xFFBA83DE), width: 2) : null,
      ),
      child: InkWell(
        onTap: () {
          widget.onDaySelected(widget.dayOfMonth);
        },
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.dayOfWeek,
                  style: TextStyle(fontSize: 15, color: Colors.white70),
                ),
                Text(
                  widget.dayOfMonth.toString().padLeft(2, '0'),
                  style: TextStyle(fontSize: 15, color: Colors.white70),
                ),
              ],
            ),
            Positioned(
              bottom: -5,
              child: Visibility(
                visible: widget.isSelected,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Color(0xFFBA83DE),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}