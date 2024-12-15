import 'package:flutter/material.dart';

class TodayTask extends StatefulWidget {
  Color color;
  String title, time;
  bool isSelected = true;

  TodayTask(
      {required this.color,
        required this.title,
        required this.time,
        required this.isSelected,
        super.key});

  @override
  State<TodayTask> createState() => _TodayTaskState();
}

class _TodayTaskState extends State<TodayTask> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xFF181818), borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 90,
            width: 16,
            decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10))),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today_rounded,
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.time,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )
                ],
              ),
            ],
          ),
          Spacer(),
          InkWell(
            onTap: () {
              setState(() {
                widget.isSelected=!widget.isSelected;
              });
            },
            child: Container(
                margin: EdgeInsets.only(right: 20),
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color:(widget.isSelected==true) ? Color(0xFFBA83DE): null,
                    border: Border.all(color:Color(0xFFBA83DE),width: 2)
                ),
                child: (widget.isSelected==true) ? Icon(
                  Icons.check,
                  size: 18,
                  color: Colors.black,
                ) : null
            ),
          ),
        ],
      ),
    );
  }
}