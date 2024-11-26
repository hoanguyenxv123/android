import 'package:flutter/material.dart';

class Times extends StatefulWidget {
  const Times({super.key});

  @override
  State<Times> createState() => _TimesState();
}

class _TimesState extends State<Times> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Start Time',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Container(
                height: 54,
                width: MediaQuery.of(context).size.width * 0.43,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF181818)
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
                        '06 : 00 PM',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                )
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'End Time',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Container(
                height: 54,
                width: MediaQuery.of(context).size.width * 0.43,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF181818)
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
                        '09 : 00 PM',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                )
            ),
          ],
        ),
      ],
    );
  }
}
