import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors_app.dart';
import 'settings.dart';
import 'users.dart';
import 'chats.dart';
import 'home.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  final List<Widget> screen = <Widget>[
    const Home(),
    const Chats(),
    const Users(),
    const Settings()
  ];
  final List<String> titleAppBar = <String>[
    'home'.tr,
    'home'.tr,
    'home'.tr,
    'profile'.tr,
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleAppBar[currentIndex]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) => setState(() => currentIndex = value),
        selectedItemColor: ColorsApp.green,
        unselectedItemColor: ColorsApp.geryBold,
        showSelectedLabels: false,
        iconSize: 28,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.wechat_sharp), label: 'Chats'),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on), label: 'Users'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Settings'),
        ],
      ),
      body: screen[currentIndex],
    );
  }
}
