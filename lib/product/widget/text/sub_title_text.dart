import 'package:flutter/material.dart';
import 'package:introduce_your_city_task/product/constants/color_constants.dart';
import 'package:kartal/kartal.dart';

class SubTitleTextWidget extends StatelessWidget {
  final String title;
  final Color? color;
  const SubTitleTextWidget({super.key,required this.title,this.color});

  @override
  Widget build(BuildContext context) {
    return Text(title,  style: context.general.textTheme.titleMedium!.copyWith(fontFamily: "Inter",fontWeight: FontWeight.w600, letterSpacing: 1.3,color:color ?? ColorConstants.primaryColor,));
  }
}
