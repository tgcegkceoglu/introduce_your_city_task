import 'package:flutter/material.dart';
import 'package:introduce_your_city_task/product/constants/image_constants.dart';
import 'package:introduce_your_city_task/product/widget/card/rounded_card.dart';

ImageErrorWidgetBuilder imageErrorBuilder({required BuildContext context,required double width,required double height}) {
  return (context, error, stackTrace) {
    return RoundedCard(height: height,width: width,child: ImageConstants.noImageIcon.toSvgImage);
  };
}









