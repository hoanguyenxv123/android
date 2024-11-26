import 'package:flutter/material.dart';

class Priority extends StatelessWidget {
  const Priority({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Priority',style: TextStyle(
            color: Colors.white,
            fontSize: 20
        ),),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ButtonCustom(level: 'High', color: Color(0xFFFFDCC8)),
            ButtonCustom(level: 'Medium', color: Color(0xFFC8E6FF)),
            ButtonCustom(level: 'Low', color: Color(0xFFDCC8E6)),
          ],
        )
      ],
    );
  }
}

class ButtonCustom extends StatefulWidget {
  String level;
  Color color;
  bool isCheck;
  ButtonCustom({super.key,required this.level,required this.color,this.isCheck = false});

  @override
  State<ButtonCustom> createState() => _ButtonCustomState();
}

class _ButtonCustomState extends State<ButtonCustom> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          widget.isCheck=!widget.isCheck;
        });
      },
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width*0.27,
        child: Center(
          child: Text(widget.level,style: TextStyle(
              color: (widget.isCheck==true)?Colors.black:Colors.white ,
              fontSize: 20
          ),),
        ),
        decoration: BoxDecoration(
          color: (widget.isCheck==true)?widget.color:Colors.black,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: widget.color,
            width: 2
          )
        ),
      ),
    );
  }
}

