import 'package:flutter/material.dart';
import 'package:introduce_your_city_task/product/constants/color_constants.dart';
import 'package:introduce_your_city_task/product/models/category_detail.dart';
import 'package:introduce_your_city_task/product/widget/header/header.dart';
import 'package:introduce_your_city_task/product/widget/image/custom_rounded_image.dart';
import 'package:introduce_your_city_task/product/widget/text/description_text.dart';
import 'package:introduce_your_city_task/product/widget/text/info_text.dart';
import 'package:kartal/kartal.dart';

class HomeDetailCard extends StatelessWidget {
  final CategoryDetail categoryDetail;
  const HomeDetailCard({super.key,required this.categoryDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: context.padding.horizontalLow,
        padding: context.padding.onlyTopMedium,
        child:  SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(title: categoryDetail.title ?? ""),
              _Image(image: categoryDetail.image ?? ""),                          
              _Type(type: categoryDetail.type ?? ""),
               _Description(description: categoryDetail.description ?? ""),
            ],
          ),
        ),
      ),
    );
  }

}



class _Image extends StatelessWidget {
  final String image;
  const _Image({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.padding.onlyTopNormal,
      child: CustomRoundedImage(strImagePath:image,height: context.sized.dynamicHeight(.3),width: context.sized.width),
    );
  }
}

class _Type extends StatelessWidget {
  final String type;
  const _Type({required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.padding.verticalLow,
      padding: context.padding.low,
      decoration: BoxDecoration(
        color: ColorConstants.purple,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InfoTextWidget(title: type,color: ColorConstants.white,),
    );
  }
}

class _Description extends StatelessWidget {
  final String description;
  const _Description({required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.padding.onlyBottomMedium,
      padding: context.padding.horizontalLow,
      child: DescriptionTextWidget(title: description),
    );
  }
}