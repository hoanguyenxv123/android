import 'package:flutter/material.dart';

class TextData extends StatefulWidget {
  const TextData({super.key});

  @override
  State<TextData> createState() => _TextDataState();
}

class _TextDataState extends State<TextData> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: Color(0xFF181818),
              borderRadius: BorderRadius.circular(10)
            ),
          child: TextField(
            style: TextStyle(
              color: Colors.white,
              fontSize: 19
            ),
            decoration: InputDecoration(
              hintText: 'Name',
              hintStyle: TextStyle(
                  color: Colors.white70,
                  fontSize: 19
              ),
              border: InputBorder.none
            ),
          ),
        ),
        SizedBox(height: 20,),
        Container(
          height: 150,
          padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: Color(0xFF181818),
              borderRadius: BorderRadius.circular(10)
            ),
          child: TextField(
            style: TextStyle(
              color: Colors.white,
              fontSize: 19
            ),
            decoration: InputDecoration(
              hintText: 'Description',
              hintStyle: TextStyle(
                  color: Colors.white70,
                  fontSize: 19
              ),
              border: InputBorder.none
            ),
            maxLines: null, // Cho phép xuống dòng không giới hạn
            minLines: 1,
          ),
        )
      ],
    );
  }
}
