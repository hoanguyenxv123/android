import 'package:flutter/material.dart';
import 'package:to_do_list/constants/app_colors.dart';
import 'package:to_do_list/constants/app_icons.dart';

class PrimaryAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const PrimaryAppbar({super.key, required this.title });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.hex020206,
      leading: GestureDetector(
        onTap: (){
          Navigator.of(context).pop();
        },
        child: SizedBox(
          width: 30,
          child: Center(
            child: Image.asset(AppIcons.back,
            height: 30,
            width: 30,),
          ),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 25
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
