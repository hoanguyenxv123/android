import 'dart:async';

import 'package:flutter/material.dart';
import 'package:to_do_list/common_widegts/primary_title.dart';

class Time extends StatefulWidget {
  final String title;
  final DateTime dateTime;
  const Time({super.key, required this.dateTime, required this.title});

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  String formattedTime = '';
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    updateTime();  // Update time immediately
    startClock();  // Start the timer
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  // Update the time
  void updateTime() {
    final now = DateTime.now();
    setState(() {
      int hour = now.hour % 12; // Convert hour to 12-hour format
      hour = hour == 0 ? 12 : hour; // If hour is 0, set it to 12
      // Format the hour without leading zero for AM times
      String hourString = hour.toString(); // No leading zero for any hour

      formattedTime = '${hourString.toString().padLeft(2, '0')} : ${now.minute.toString().padLeft(2, '0')} ${now.hour >= 12 ? 'PM' : 'AM'}';
    });
  }

  // Start the timer to update the time every second
  void startClock() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      updateTime();  // Update time every second
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PrimaryTitle(title: widget.title),
        Container(
          margin: EdgeInsets.only(top: 10),
          height: 58,
          width: MediaQuery.of(context).size.width * 0.45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFF181818),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.access_time,
                  color: Color(0xFFBA83DE),
                  size: 25,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  formattedTime,
                  style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}