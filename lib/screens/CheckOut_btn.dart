import 'package:flutter/material.dart';

import '../Shared/appstyl.dart';

class CheckOutButton extends StatelessWidget {
  const CheckOutButton({
    super.key, this.onTab, required this.lable,
  });

  final void Function()? onTab;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(12))),
          height: 40,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Center(
            child: Text(
              lable,
              style: appstyle(20, Colors.white, FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
