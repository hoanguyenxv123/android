import 'package:flutter/material.dart';
import 'package:to_do_list/constants/app_colors.dart';

class BottomnavigationbarHome extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomnavigationbarHome({
    required this.currentIndex,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.hex181818,
      unselectedItemColor: Colors.white,
      selectedItemColor: AppColors.hexBA83DE,
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}

