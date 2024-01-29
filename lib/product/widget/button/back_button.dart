import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';


class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key,required this.onTap,  this.color});

  final VoidCallback onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: onTap,
    child: Container(
      padding: context.padding.verticalLow,
      alignment: Alignment.centerLeft,
      child: Icon(Icons.arrow_back_ios, color: color)),
  );
  }
}
