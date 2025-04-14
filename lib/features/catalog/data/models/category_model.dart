import '../../domain/entities/category.dart';

class CategoryModel extends Category {
  CategoryModel({
    required super.id,
    required super.count,
    required super.description,
    required super.link,
    required super.name,
    required super.slug,
    required super.taxonomy,
    required super.parent,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      count: json['count'],
      description: json['description'] ?? '',
      link: json['link'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      taxonomy: json['taxonomy'] ?? '',
      parent: json['parent'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'count': count,
      'description': description,
      'link': link,
      'name': name,
      'slug': slug,
      'taxonomy': taxonomy,
      'parent': parent,
    };
  }
}