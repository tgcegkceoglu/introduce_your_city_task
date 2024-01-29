import 'package:flutter/material.dart';
import 'package:introduce_your_city_task/product/constants/color_constants.dart';
import 'package:kartal/kartal.dart';

class TitleTextWidget extends StatelessWidget {
  final String title;
  const TitleTextWidget({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title,  style: context.general.textTheme.titleLarge!.copyWith(fontFamily: "Inter",fontWeight: FontWeight.bold,color: ColorConstants.primaryColor));
  }
}
