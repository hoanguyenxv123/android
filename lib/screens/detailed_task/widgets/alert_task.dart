import 'package:flutter/material.dart';

import '../../../common_widegts/alert.dart';

class AlertTask extends StatelessWidget {
  final bool check;
  final ValueChanged<bool> onCheckChanged;
  const AlertTask({super.key, required this.check, required this.onCheckChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Get alert for this task',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        Alert(
          isChecked: check,
          onChanged: onCheckChanged, // Pass the callback
        ),
      ],
    );
  }
}
