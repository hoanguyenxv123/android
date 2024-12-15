import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as custom_badge;

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'You have got 5 tasks \ntoday to complete',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        Stack(
          alignment: Alignment.bottomRight, // Đặt vị trí của badge
          children: [
            CircleAvatar(
              radius: 32,
             backgroundImage: AssetImage('assets/images/avata.jpg'),
            ),
            Positioned(
              bottom: 0, // Đặt badge ở dưới cùng
              right: 0, // Đặt badge ở bên phải
              child: Container(
                padding: EdgeInsets.only(right: 4,left: 4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20), // Để badge tròn
                ),
                constraints: BoxConstraints(
                  minWidth: 20,
                  minHeight: 20,
                ),
                child: Center(
                  child: Text(
                    '599', // Số thông báo
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12, // Kích thước chữ
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}