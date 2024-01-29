import 'package:flutter/material.dart';
import 'package:introduce_your_city_task/product/constants/color_constants.dart';
import 'package:introduce_your_city_task/product/constants/image_constants.dart';

class PageLoadingIndicator extends StatelessWidget {
  const PageLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: ColorConstants.black.withOpacity(.45),
      child: ImageConstants.pageLoadingLottie.toLottie,
    );
  }
}
