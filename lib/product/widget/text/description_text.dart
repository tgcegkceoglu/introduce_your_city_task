import 'package:flutter/material.dart';
import 'package:introduce_your_city_task/product/constants/color_constants.dart';
import 'package:kartal/kartal.dart';

class DescriptionTextWidget extends StatelessWidget {
  final String title;
  final Color? color;
  const DescriptionTextWidget({super.key,required this.title,this.color});

  @override
  Widget build(BuildContext context) {
    return Text(title,  style: context.general.textTheme.titleMedium!.copyWith(fontFamily: "Inter",letterSpacing:1,color: color ??  ColorConstants.primaryColor));
  }
}
