import 'package:flutter/material.dart';
import 'package:to_do_list/constants/app_colors.dart';
import 'package:to_do_list/constants/app_icons.dart';

class PrimaryAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String titel;
  const PrimaryAppbar({super.key, required this.titel });

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
        titel,
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
