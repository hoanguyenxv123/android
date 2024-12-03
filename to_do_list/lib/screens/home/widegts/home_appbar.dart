import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_list/constants/app_colors.dart';
import 'package:to_do_list/constants/app_images.dart';
import 'package:to_do_list/screens/home/widegts/search_field.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  final ValueChanged<String> onSearchChanged;

  const HomeAppbar({required this.onSearchChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.hex020206,
      systemOverlayStyle: SystemUiOverlayStyle.light,

      /// màu của biếu tượng trên Appbar
      title: Text(
        'You have got 5 tasks\ntoday to complete ✍️',
        maxLines: 2,
        style: TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
      ),
      actions: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(AppImages.avatar),
              radius: 30,
            ),
            Badge(
              backgroundColor: Colors.red,
              label: Text(
                '5',
                style: TextStyle(fontSize: 14), // Tăng kích thước chữ
              ), // Tăng kích thước nhỏ
            )
          ],
        ),
      ],
      bottom: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: SearchField(
                hintText: 'Search Task Here',
                onChanged: onSearchChanged
            ),
          )),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(150);
}
