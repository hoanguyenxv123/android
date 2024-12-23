import 'package:flutter/material.dart';

import '../../../common_widegts/text_data.dart';

class Schedule extends StatelessWidget {
  const Schedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Schedule',style: TextStyle(
            color: Colors.white,
            fontSize: 22
        ),),
        SizedBox(height: 20,),
        TextData(hintText: 'Name'),
        SizedBox(height: 20,),
        TextData(hintText: 'Description',isMultiline: true,height: 120,),
      ],
    );
  }
}
