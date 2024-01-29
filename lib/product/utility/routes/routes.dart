import 'package:flutter/material.dart';
import 'package:introduce_your_city_task/feature/home/sub_view/home_category_list.dart';
import 'package:introduce_your_city_task/feature/home/sub_view/home_detail_card.dart';
import 'package:introduce_your_city_task/product/models/category_detail.dart';

void goToDetailCard(BuildContext context, CategoryDetail categoryDetail) {
  goToPush(context: context, route: HomeDetailCard(categoryDetail: categoryDetail));
}

void goToCategoryList({required BuildContext context,required String title,required List<CategoryDetail> categoryDetailList}) {
  goToPush(context: context, route: HomeCategoryList(categoryDetailList: categoryDetailList,title: title));
}

void goToPush({required BuildContext context,required Widget route}) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => route),
  );
}

void goToPushAndRemoveUntil({required BuildContext context,required Widget route}) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => route),(route) => false, 
  );
}
