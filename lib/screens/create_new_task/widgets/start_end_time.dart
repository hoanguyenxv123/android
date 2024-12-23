import 'package:flutter/material.dart';

import '../../../common_widegts/time.dart';

class StartEndTime extends StatelessWidget {
  const StartEndTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Time(dateTime: DateTime.now(), title: 'Start Time'),
        Time(dateTime: DateTime.now(), title: 'End Time')
      ],
    );
  }
}
