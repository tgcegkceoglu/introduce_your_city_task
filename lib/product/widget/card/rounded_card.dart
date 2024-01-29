import 'package:flutter/material.dart';
import 'package:introduce_your_city_task/product/constants/color_constants.dart';
import 'package:kartal/kartal.dart';

class RoundedCard extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  const RoundedCard({super.key,required this.height,required this.width,required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        padding: context.padding.normal,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1,color: ColorConstants.primaryColor)
        ),
        child: child
    );
  }
}
