import 'package:flutter/material.dart';
import 'package:introduce_your_city_task/product/constants/color_constants.dart';
import 'package:kartal/kartal.dart';

class LimitedInfoText extends StatelessWidget {
  final String title;
  final Color? color;
  final FontWeight? fontWeight;
  const LimitedInfoText({super.key,required this.title,this.color,this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(title,  style: context.general.textTheme.bodySmall!.copyWith(fontFamily: "Inter",fontWeight:fontWeight,color:ColorConstants.primaryColor),maxLines: 3,overflow: TextOverflow.ellipsis,);
  }
}
