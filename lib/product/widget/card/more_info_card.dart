import 'package:flutter/material.dart';
import 'package:introduce_your_city_task/product/constants/image_constants.dart';
import 'package:introduce_your_city_task/product/constants/string_constants.dart';
import 'package:introduce_your_city_task/product/widget/text/info_text.dart';
import 'package:introduce_your_city_task/product/widget/text/sub_title_text.dart';

class MoreInfoCard extends StatelessWidget {
  final String title;
  final Null Function() onTap;
  const MoreInfoCard({super.key,required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SubTitleTextWidget(title:title),
          ),
          Row(
            children: [
              const InfoTextWidget(title: StringConstants.more),
              ImageConstants.arrowRightIcon.toSvgImage,
            ],
          ),
        ],
      ),
    );
  }
}
