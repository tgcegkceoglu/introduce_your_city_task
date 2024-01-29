import 'package:flutter/material.dart';
import 'package:introduce_your_city_task/product/constants/color_constants.dart';
import 'package:introduce_your_city_task/product/widget/button/back_button.dart';
import 'package:introduce_your_city_task/product/widget/text/detail_title_text.dart';

class Header extends StatelessWidget {
  final String title;
  const Header({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BackButtonWidget(onTap: (){Navigator.pop(context);},color: ColorConstants.primaryColor,),
        Expanded(child: DetailTitleTextWidget(title: title)),
      ],
    );
  }
}
