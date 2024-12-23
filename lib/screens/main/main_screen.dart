import 'package:flutter/material.dart';
import 'package:to_do_list/screens/home/home_screen.dart';

import '../../constants/app_colors.dart';
import '../create_new_task/create_new_task.dart';
import '../home/widegts/button_addnew.dart';
import '../setting/setting_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ButtonAddnew(onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CreateNewTask()));
      }),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.hex181818,
        selectedItemColor: AppColors.hexBA83DE,
        unselectedItemColor: Colors.white.withOpacity(0.8),
        iconSize: 24,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const SettingScreen();
      default:
        return const Placeholder();
    }
  }
}
