import 'package:flutter/material.dart';

class DayTask extends StatefulWidget {
  const DayTask({super.key});

  @override
  State<DayTask> createState() => _DayTaskState();
}

class _DayTaskState extends State<DayTask> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Today's Task",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'See All',
            style: TextStyle(fontSize: 18),
          ),
        )
      ],
    );
  }
}
