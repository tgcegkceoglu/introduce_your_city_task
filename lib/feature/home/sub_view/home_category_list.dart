import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:introduce_your_city_task/product/constants/image_constants.dart';
import 'package:introduce_your_city_task/product/models/category_detail.dart';
import 'package:introduce_your_city_task/product/utility/extension/string_extension.dart';
import 'package:introduce_your_city_task/product/widget/card/category_list_item_card.dart';
import 'package:introduce_your_city_task/product/widget/header/header.dart';
import 'package:introduce_your_city_task/product/widget/textfield/search_textfield.dart';
import 'package:kartal/kartal.dart';

class HomeCategoryList extends ConsumerStatefulWidget {
 final List<CategoryDetail> categoryDetailList;
 final String title;
const HomeCategoryList({super.key,required this.categoryDetailList,required this.title});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeCategoryListState();
}

class _HomeCategoryListState extends ConsumerState<HomeCategoryList> {

  final TextEditingController _searchController = TextEditingController();

  late List<CategoryDetail> _categoryDetailList;

  @override
  void initState() {
    _categoryDetailList = widget.categoryDetailList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: context.padding.horizontalLow,
        padding: context.padding.verticalMedium,
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(title: widget.title),
            SearchTextField(
              controller: _searchController,
              onChanged: (value){
                _categoryDetailList =  widget.categoryDetailList.where((element) =>  element.title?.toSnakeCase().contains(value) ?? false).toList();
                setState(() {});
            }),
            Expanded(
              child: _categoryDetailList.isNotEmpty ? MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                  physics:const AlwaysScrollableScrollPhysics(),
                  itemCount: _categoryDetailList.length,
                  itemBuilder: (context, index) {
                  return CategoryListItemCard(categoryDetailItem: _categoryDetailList[index]);
                },),
              ): ImageConstants.notFoundLottie.toLottie),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }
}

