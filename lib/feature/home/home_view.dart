import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:introduce_your_city_task/feature/home/home_provider.dart';
import 'package:introduce_your_city_task/product/constants/color_constants.dart';
import 'package:introduce_your_city_task/product/constants/image_constants.dart';
import 'package:introduce_your_city_task/product/constants/string_constants.dart';
import 'package:introduce_your_city_task/product/utility/extension/string_extension.dart';
import 'package:introduce_your_city_task/product/utility/routes/routes.dart';
import 'package:introduce_your_city_task/product/widget/card/more_info_card.dart';
import 'package:introduce_your_city_task/product/widget/image/custom_rounded_image.dart';
import 'package:introduce_your_city_task/product/widget/loading_indicator/page_loading_indicator.dart';
import 'package:introduce_your_city_task/product/widget/shimmer/shimmer_widget.dart';
import 'package:introduce_your_city_task/product/widget/text/info_text.dart';
import 'package:introduce_your_city_task/product/widget/text/description_text.dart';
import 'package:introduce_your_city_task/product/widget/text/sub_title_text.dart';
import 'package:introduce_your_city_task/product/widget/text/title_text.dart';
import 'package:kartal/kartal.dart';



final _homeProvider = StateNotifierProvider<HomeNotifier,HomeState>((ref) {
  return HomeNotifier();
});


class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {

  @override
  void initState(){
    super.initState();

   Future.microtask(() => ref.read(_homeProvider.notifier).fetchAndLoad());

  }

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      body: Stack(
        children: [
          ShimmerWidget(
            hasData:!(ref.watch(_homeProvider).isLoading ?? false),
            child: Padding(
              padding:context.padding.normal,
              child: ListView(
                children: const [
                   _Header(),
                   _PlacesToVisit(),
                   _TraditionalCuisine(),
                  _DiscoverMore(),
                ],
              ),
            ),
          ),
      
          if(ref.watch(_homeProvider).isLoading ?? false) const PageLoadingIndicator(),
        ],
      ),
    );
  }
}


class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.onlyBottomMedium,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleTextWidget(title: StringConstants.cityName),
                Padding(
                  padding: context.padding.onlyTopLow,
                  child: const DescriptionTextWidget(title: StringConstants.homeSubTitle),
                ),
              ],
            ),
          ),
          Container(
            padding: context.padding.low,
            decoration: BoxDecoration(
              color: ColorConstants.grey,
              borderRadius: BorderRadius.circular(10)
            ),
            child:  Row(
              children: [
                ImageConstants.populationIcon.toImage,
                Padding(
                  padding: context.padding.onlyLeftLow,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InfoTextWidget(title: StringConstants.population),
                      DescriptionTextWidget(title: StringConstants.populationNumber,color: ColorConstants.darkGrey,),
                    ],),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PlacesToVisit extends ConsumerWidget {
  const _PlacesToVisit();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final placeToVisitItem = ref.watch(_homeProvider).categoryDetail?.where((element){
     return element.category == StringConstants.placesToVisit.toSnakeCase();
    }).toList() ?? [];

    return Visibility(
      visible: placeToVisitItem.isNotEmpty,
      child: Padding(
        padding: context.padding.onlyBottomMedium,
        child: Column(
          children: [
            MoreInfoCard(title: StringConstants.placesToVisit,onTap: (){
              goToCategoryList(context: context,categoryDetailList:placeToVisitItem,title: StringConstants.placesToVisit);
            }),
            SizedBox(
              height: context.sized.dynamicHeight(.2),
              child: ListView.builder(
                itemCount: placeToVisitItem.length,
                scrollDirection: Axis.horizontal,
                itemBuilder:(context, index) {
                 return GestureDetector(
                  onTap: ()=>goToDetailCard(context, placeToVisitItem[index]),
                   child: Container(
                     margin: context.padding.onlyRightLow,
                     child: CustomRoundedImage(strImagePath: placeToVisitItem[index].image,height: context.sized.dynamicHeight(.2),width: context.sized.dynamicWidth(.5)),
                   
                   ),
                 );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TraditionalCuisine extends ConsumerWidget {
  const _TraditionalCuisine();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final traditionalCuisine = ref.watch(_homeProvider).categoryDetail?.where((element){
     return element.category == StringConstants.traditionalCuisine.toSnakeCase();
    }).toList() ?? [];

    return Visibility(
      visible: traditionalCuisine.isNotEmpty,
      child: Padding(
        padding: context.padding.onlyBottomMedium,
        child: Column(
          children: [
            MoreInfoCard(title: StringConstants.traditionalCuisine,onTap: (){
              goToCategoryList(context: context,categoryDetailList:traditionalCuisine,title: StringConstants.traditionalCuisine);
            }),
            SizedBox(
              height: context.sized.dynamicWidth(.2),
              child: ListView.builder(
                itemCount: traditionalCuisine.length,
                scrollDirection: Axis.horizontal,
                itemBuilder:(context, index) {
                  return GestureDetector(
                    onTap: (){
                        goToDetailCard(context, traditionalCuisine[index]);
                    },
                    child: Container(
                      margin: context.padding.onlyRightLow,
                      child: CustomRoundedImage(strImagePath: traditionalCuisine[index].image,height: context.sized.dynamicWidth(.2),width: context.sized.dynamicWidth(.2)),
                          
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DiscoverMore extends ConsumerWidget {
  const _DiscoverMore();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  
    final category = ref.watch(_homeProvider).category ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SubTitleTextWidget(title:StringConstants.discoverMore),
        Container(
          margin: context.padding.onlyTopLow,
          height: context.sized.dynamicHeight(.27),
          child: ListView.builder(
            itemCount: category.length,
            scrollDirection: Axis.horizontal,
            itemBuilder:(context, index) {
              return GestureDetector(
                onTap: (){
                  
                  final selectedCategoryList = ref.watch(_homeProvider).categoryDetail?.where((element){
                      return element.category?.toSnakeCase() == category[index].name?.toSnakeCase();
                  }).toList() ?? [];


                  goToCategoryList(context: context,categoryDetailList:selectedCategoryList,title: category[index].name ?? "");

                },
                child: Container(
                  margin: context.padding.onlyRightLow,
                  child: Stack(
                    children: [
                      CustomRoundedImage(strImagePath: category[index].image,height: context.sized.dynamicHeight(.27),width: context.sized.dynamicWidth(.46)),
                      Positioned(bottom: 0,child: Container(
                        color: ColorConstants.black.withOpacity(0.3),
                        width: context.sized.dynamicWidth(.46),
                        padding: context.padding.low,
                        child:SubTitleTextWidget(title: category[index].name ?? "",color: ColorConstants.white,),
                      ),)
                    ],
                  ),
                
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}


