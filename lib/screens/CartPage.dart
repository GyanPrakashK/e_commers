import 'package:flutter/material.dart';

import '../Shared/appstyl.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'This is Card Page ',
        style: appstyle(40, Colors.black, FontWeight.bold),
      )),
    );
  }
}