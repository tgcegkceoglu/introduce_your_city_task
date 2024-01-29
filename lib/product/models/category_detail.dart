import 'package:equatable/equatable.dart';
import 'package:introduce_your_city_task/product/utility/base/base_firebase_model.dart';

class CategoryDetail extends Equatable
    with IdModel, BaseFirebaseModel<CategoryDetail> {
  @override
  final String? id;
  final String? type;
  final String? category;
  final String? title;
  final String? image;
  final String? description;

  const CategoryDetail({
    this.id,
    this.type,
    this.category,
    this.title,
    this.image,
    this.description,
  });

  @override
  List<Object?> get props => [id, type, category, title, image, description];

  CategoryDetail copyWith({
    String? id,
    String? type,
    String? category,
    String? title,
    String? image,
    String? description,
  }) {
    return CategoryDetail(
      id: id ?? this.id,
      type: type ?? this.type,
      category: category ?? this.category,
      title: title ?? this.title,
      image: image ?? this.image,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'category': category,
      'title': title,
      'image': image,
      'description': description,
    };
  }

  @override
  CategoryDetail fromJson(Map<String, dynamic> json) {
    return CategoryDetail(
      id: json['id'] as String?,
      type: json['type'] as String?,
      category: json['category'] as String?,
      title: json['title'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
    );
  }
}
