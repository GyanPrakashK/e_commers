import 'package:e_commers/Shared/appstyl.dart';
import 'package:flutter/material.dart';

class CategoryBtn extends StatelessWidget {
  const CategoryBtn(
      {super.key, this.onPress, required this.buttonClr, required this.label});
  final Function()? onPress;
  final Color buttonClr;
  final String label;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width * 0.250,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: buttonClr,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(Radius.circular(9)),
        ),
        child: Center(
          child: Text(
            label,
            style: appstyle(15, buttonClr, FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
