import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

enum ImageConstants{
  populationIcon('population'),
  arrowRightIcon('arrow_right'),
  noImageIcon('no_picture'),
  pageLoadingLottie('page_loading'),
  imageLoadingLottie('image_loading'),
  notFoundLottie('not_found'),
  appIcon('app_icon');

  final String value;
  const ImageConstants(this.value);

  String get toPng => 'assets/images/$value.png';
  Image get toImage => Image.asset(toPng);

  String get toSvg=> 'assets/images/$value.svg';
  SvgPicture get toSvgImage => SvgPicture.asset(toSvg);

  String get toJsonLottie=> 'assets/lotteries/$value.json';

  LottieBuilder get toLottie => Lottie.asset(
    toJsonLottie,
    frameRate: FrameRate.max,
    repeat: true,
  );
}