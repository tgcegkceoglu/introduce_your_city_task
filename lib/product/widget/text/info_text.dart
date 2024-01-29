import 'package:flutter/material.dart';
import 'package:introduce_your_city_task/product/constants/color_constants.dart';
import 'package:kartal/kartal.dart';

class InfoTextWidget extends StatelessWidget {
  final String title;
  final Color? color;
  const InfoTextWidget({super.key,required this.title,this.color});

  @override
  Widget build(BuildContext context) {
    return Text(title,  style: context.general.textTheme.bodySmall!.copyWith(fontFamily: "Inter",fontWeight: FontWeight.w500,color: color ?? ColorConstants.darkBlue));
  }
}
