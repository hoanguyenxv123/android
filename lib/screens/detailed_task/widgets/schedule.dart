import 'package:flutter/material.dart';

import '../../../common_widegts/text_data.dart';

class Schedule extends StatelessWidget {
  final String name;
  final String description;

  const Schedule({super.key, required this.name, required this.description});

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
        TextData(hintText: 'Name',initialValue: name,),
        SizedBox(height: 20,),
        TextData(hintText: 'Description',isMultiline: true,height: 120,initialValue: description,),
      ],
    );
  }
}
