import 'package:flutter/material.dart';
import 'package:introduce_your_city_task/product/constants/image_constants.dart';
import 'package:introduce_your_city_task/product/widget/card/rounded_card.dart';
import 'package:introduce_your_city_task/product/widget/errors/error_builder.dart';

class CustomRoundedImage extends StatelessWidget {
  final String? strImagePath;
  final double height;
  final double width;

  const CustomRoundedImage({
    Key? key,
    required this.height,
    required this.width,
    this.strImagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return strImagePath != null && strImagePath != ""
        ? ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(          
              strImagePath!,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              width: width,
              height: height,
              errorBuilder: imageErrorBuilder(
                  context: context, height: height, width: width),
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return RoundedCard(
                    height: height,
                    width: width,
                    child: ImageConstants.imageLoadingLottie.toLottie);
              },
            ),
          )
        : RoundedCard(
            width: width,
            height: height,
            child: ImageConstants.noImageIcon.toSvgImage);
  }
}
