import 'package:flutter/material.dart';
import 'package:introduce_your_city_task/product/constants/color_constants.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final Widget child;
  final bool hasData;

  const ShimmerWidget({Key? key, required this.child, required this.hasData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(hasData) return child;
    return Shimmer.fromColors(
        baseColor:  ColorConstants.darkGrey.withOpacity(.3),
        highlightColor:ColorConstants.darkGrey.withOpacity(.4),
        direction: ShimmerDirection.ltr,
        enabled: true,
        period: const Duration(seconds: 1),
        loop: 30,
        child: child,
  );
  }
}
