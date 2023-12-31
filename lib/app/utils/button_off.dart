import 'package:book_management_mobile/app/utils/colors.dart';
import 'package:book_management_mobile/app/utils/size_helper.dart';
import 'package:flutter/material.dart';

class ButtonOff extends StatelessWidget {
  final Widget child;
  const ButtonOff({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: displayWidth(context),
      height: 50,
      decoration: BoxDecoration(
          color: borderPrimary100, borderRadius: BorderRadius.circular(10)),
      child: Center(child: child),
    );
  }
}
