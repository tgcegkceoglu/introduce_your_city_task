import 'package:flutter/material.dart';
import 'package:introduce_your_city_task/product/constants/color_constants.dart';
import 'package:kartal/kartal.dart';

class DetailTitleTextWidget extends StatelessWidget {
  final String title;
  final Color? color;
  const DetailTitleTextWidget({super.key,required this.title,this.color});

  @override
  Widget build(BuildContext context) {
       return Text(title,  style: context.general.textTheme.titleMedium!.copyWith(fontFamily: "Inter",fontWeight: FontWeight.w600,color: ColorConstants.primaryColor),textAlign: TextAlign.center,);
  }
}
