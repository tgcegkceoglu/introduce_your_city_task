import 'package:flutter/material.dart';
import 'package:introduce_your_city_task/product/constants/color_constants.dart';
import 'package:introduce_your_city_task/product/models/category_detail.dart';
import 'package:introduce_your_city_task/product/utility/routes/routes.dart';
import 'package:introduce_your_city_task/product/widget/image/custom_rounded_image.dart';
import 'package:introduce_your_city_task/product/widget/text/limited_info_text.dart';
import 'package:kartal/kartal.dart';

class CategoryListItemCard extends StatelessWidget {
  final CategoryDetail categoryDetailItem;
  const CategoryListItemCard({super.key,required this.categoryDetailItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> goToDetailCard(context,categoryDetailItem),
      child: Container(
          margin:context.padding.onlyBottomNormal,
          padding: context.padding.low,
          decoration: BoxDecoration(
                gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ColorConstants.grey,
                  ColorConstants.purple.withOpacity(.8), 
                ],
                tileMode: TileMode.decal,
              ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
                BoxShadow(blurRadius: 3, offset: const Offset(0, 3), color: ColorConstants.black.withOpacity(.24)),
            ]
          ),
          width: context.sized.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomRoundedImage(strImagePath: categoryDetailItem.image,height: context.sized.dynamicWidth(.2),width: context.sized.dynamicWidth(.2)),
              Expanded(
                child: Padding(
                  padding: context.padding.onlyLeftLow,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [              
                    LimitedInfoText(title: categoryDetailItem.title ?? "",fontWeight: FontWeight.bold,),
                    Padding(
                      padding: context.padding.onlyTopLow,
                      child: LimitedInfoText(title: categoryDetailItem.description ?? "",fontWeight: FontWeight.w500,),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
    );
  }
}