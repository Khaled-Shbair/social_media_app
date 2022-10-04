import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import '../models/bottom_navigation_item.dart';
import 'package:flutter/material.dart';
import '../constants/colors_app.dart';
import 'package:get/get.dart';
import 'create_post.dart';
import 'profile.dart';
import 'users.dart';
import 'chats.dart';
import 'home.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  final List<BNI> bNI = <BNI>[
    BNI(const Home(), 'home'.tr),
    BNI(const Chats(), 'chats'.tr),
    BNI(const CreatePost(), 'createPost'.tr),
    BNI(const Users(), 'users'.tr),
    BNI(const Profile(), 'profile'.tr),
  ];
  final List<TabItem> items = <TabItem>[
    const TabItem(icon: Icon(Icons.home, color: Colors.white), title: ''),
    const TabItem(
        icon: Icon(Icons.wechat_sharp, color: Colors.white), title: ''),
    const TabItem(icon: Icon(Icons.add, size: 35), title: ''),
    const TabItem(
        icon: Icon(Icons.location_pin, color: Colors.white), title: ''),
    const TabItem(icon: Icon(Icons.person, color: Colors.white), title: ''),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(bNI[currentIndex].title)),
      bottomNavigationBar: ConvexAppBar(
        onTap: (value) => setState(() => currentIndex = value),
        backgroundColor: ColorsApp.green,
        style: TabStyle.fixedCircle,
        initialActiveIndex: 0,
        color: Colors.white,
        cornerRadius: 20,
        items: items,
      ),
      body: bNI[currentIndex].widget,
    );
  }
}
