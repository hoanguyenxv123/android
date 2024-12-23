import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list/common_widegts/week.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime currentDate = DateTime.now(); // Ngày hiện tại
  DateTime? selectedDate; // Ngày được chọn

  DateTime get startOfWeek {
    int weekday = currentDate.weekday;
    return currentDate.subtract(Duration(days: weekday - 1));
  }

  void updateWeek(int offset) {
    setState(() {
      currentDate = currentDate.add(Duration(days: offset * 7));
      selectedDate = null; // Reset ngày được chọn khi chuyển tuần
    });
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat('dd MMM');
    final DateTime start = startOfWeek;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => updateWeek(-1),
              customBorder: CircleBorder(),
              child: Icon(Icons.arrow_back_ios_sharp, color: Color(0xFFBA83DE)),
            ),
            Text(
              selectedDate != null
                  ? dateFormat.format(selectedDate!)
                  : '${dateFormat.format(start)} - ${dateFormat.format(start.add(Duration(days: 6)))}',
              style: TextStyle(fontSize: 20, color: Color(0xFFBA83DE)),
            ),
            InkWell(
              onTap: () => updateWeek(1),
              customBorder: CircleBorder(),
              child: Icon(Icons.arrow_forward_ios_sharp, color: Color(0xFFBA83DE)),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(7, (index) {
            DateTime day = start.add(Duration(days: index));
            String weekDay = DateFormat('EEE').format(day);

            return Week(
              dayOfMonth: day.day,
              dayOfWeek: weekDay,
              isSelected: selectedDate == day,
              onDaySelected: (int _) {
                setState(() {
                  selectedDate = day; // Cập nhật ngày đã chọn
                });
              },
            );
          }),
        )
      ],
    );
  }
}


