import 'package:buoi5/create_new/day.dart';
import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  int? selectedDay;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: () {},
                customBorder: CircleBorder(),
                child: Icon(Icons.arrow_back_ios_sharp,color: Color(0xFFBA83DE),)),
            Text(
              '${(selectedDay??1).toString().padLeft(2, '0')} Mar-11 Mar',
              style: TextStyle(fontSize: 20, color: Color(0xFFBA83DE)),
            ),
            InkWell(
                onTap: () {},
                customBorder: CircleBorder(),
                child: Icon(Icons.arrow_forward_ios_sharp,color: Color(0xFFBA83DE))),
          ],
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(7, (index) {
            int day = index + 1; // Giả sử đây là ngày 1 đến 7
            String weekDay = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"][index];

            return Day(
              dayOfMonth: day,
              dayOfWeek: weekDay,
              isSelected: selectedDay == day,
              onDaySelected: (int day) {
                setState(() {
                  selectedDay = day; // Cập nhật ngày đã chọn
                });
              },
            );
          }),
        )
      ],
    );
  }
}
