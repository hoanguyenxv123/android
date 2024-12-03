import 'package:flutter/material.dart';

class Day extends StatefulWidget {
  final int dayOfMonth;
  final String dayOfWeek;
  final Function(int) onDaySelected; // Callback để thông báo ngày đã chọn
  final bool isSelected; // Thêm biến để kiểm tra xem ngày có được chọn không

  Day({
    required this.dayOfMonth,
    required this.dayOfWeek,
    required this.onDaySelected,
    this.isSelected = false,
    super.key,
  });

  @override
  State<Day> createState() => _DayState();
}

class _DayState extends State<Day> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: 50,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: widget.isSelected ? Border.all(color: Color(0xFFBA83DE), width: 2) : null,
      ),
      child: InkWell(
        onTap: () {
          // Gọi callback khi ngày được chọn
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
            )
          ],
        ),
      ),
    );
  }
}