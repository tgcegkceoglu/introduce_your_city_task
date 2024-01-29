import 'package:equatable/equatable.dart';
import 'package:introduce_your_city_task/product/utility/base/base_firebase_model.dart';

class CategoryModel extends Equatable
    with IdModel, BaseFirebaseModel<CategoryModel> {
  @override
  final String? id;
  final String? name;
  final String? image;

  const CategoryModel({
    this.id,
    this.name,
    this.image,
  });

  @override
  List<Object?> get props => [id, name, image];

  CategoryModel copyWith({
    String? id,
    String? name,
    String? image,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }

  @override
  CategoryModel fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );
  }
}
