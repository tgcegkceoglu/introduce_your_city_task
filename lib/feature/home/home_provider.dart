import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:introduce_your_city_task/product/models/category.dart';
import 'package:introduce_your_city_task/product/models/category_detail.dart';
import 'package:introduce_your_city_task/product/utility/firebase/firebase_collections.dart';
import 'package:introduce_your_city_task/product/utility/firebase/firebase_utility.dart';

class HomeNotifier extends StateNotifier<HomeState> with FirebaseUtility{
  HomeNotifier(): super(const HomeState());

   List<CategoryDetail> _fullCategoryDetailList=[];
   List<CategoryDetail> get fullCategoryDetailList => _fullCategoryDetailList;


   Future<void> fetchCategory() async {
    final items = await fetchList<CategoryModel,CategoryModel>(const CategoryModel(),FirebaseCollections.category);
    state = state.copyWith(category: items);
   }

   Future<List<CategoryModel>?> fetchCategoryFuture() async {
    final items = await fetchList<CategoryModel,CategoryModel>(const CategoryModel(),FirebaseCollections.category);
    state = state.copyWith(category: items);
    return items;
   }

   Future<List<CategoryDetail>> fetchCategoryDetail() async {
    final items = await fetchList<CategoryDetail,CategoryDetail>(const CategoryDetail(),FirebaseCollections.categoryDetail);
    state = state.copyWith(categoryDetail: items);
    _fullCategoryDetailList =items ?? [];
    return _fullCategoryDetailList;
   }


  Future<void> fetchAndLoad() async {
    state = state.copyWith(isLoading: true);
    
    await Future.wait([fetchCategory(),fetchCategoryDetail()]);
    state = state.copyWith(isLoading: false);
  }
}


class HomeState extends Equatable{
  const HomeState({this.isLoading,this.category,this.categoryDetail});

  final bool? isLoading;
  final List<CategoryModel>? category;
  final List<CategoryDetail>? categoryDetail;

  @override
  List<Object?> get props => [];

  HomeState copyWith({
    List<CategoryModel>? category,
    List<CategoryDetail>? categoryDetail,
    bool? isLoading,
  }){
    return HomeState(
      category:category ?? this.category,
      categoryDetail:categoryDetail ?? this.categoryDetail,
      isLoading: isLoading ?? this.isLoading
      );
  }
}