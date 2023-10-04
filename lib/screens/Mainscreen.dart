// import 'package:e_commers/Shared/Botom_navi_Widget.dart';
// import 'package:e_commers/Shared/appstyl.dart';
import 'package:e_commers/Shared/bottom_navi.dart';
import 'package:e_commers/controllers/mainscreen_provider.dart';
import 'package:e_commers/screens/CartPage.dart';
import 'package:e_commers/screens/Homepage.dart';
import 'package:e_commers/screens/Profilepage.dart';
import 'package:e_commers/screens/SearchPage.dart';
import 'package:flutter/material.dart';
// import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pageList = const [
    HomePage(),
    SearchPage(),
    HomePage(),
    CardPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
        builder: (context, mainScreenNotifier, child) {
      return Scaffold(
        backgroundColor: const Color(0xFFE2E2E2),
        body: pageList[mainScreenNotifier.pageIndex],
        bottomNavigationBar:const BottomNavi(),
      );
      
    });
  }
}
