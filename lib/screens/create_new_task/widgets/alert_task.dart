import 'package:flutter/material.dart';

import '../../../common_widegts/alert.dart';

class AlertTask extends StatelessWidget {
  const AlertTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Get alert for this task',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        Alert(onChanged: (bool value) {  },)
      ],
    );
  }
}
