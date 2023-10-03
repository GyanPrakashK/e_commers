import 'package:e_commers/Shared/Botom_navi_Widget.dart';
import 'package:e_commers/Shared/appstyl.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      bottomNavigationBar: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BotomNaviWidget(
                onTap: () {},
                icon: Ionicons.home,
              ),
              BotomNaviWidget(
                onTap: () {},
                icon: Ionicons.search,
              ),
              BotomNaviWidget(
                onTap: () {},
                icon: Ionicons.add,
              ),
              BotomNaviWidget(
                onTap: () {},
                icon: Ionicons.cart,
              ),
              BotomNaviWidget(
                onTap: () {},
                icon: Ionicons.person,
              ),
            ],
          ),
        ),
      )),
      body: Center(
        child: Text(
          'mainscreen',
          style: appstyle(40, Colors.black, FontWeight.bold),
        ),
      ),
    );
  }
}
