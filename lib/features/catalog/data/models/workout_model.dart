import '../../domain/entities/workout.dart';

class WorkoutModel extends Workout {
  WorkoutModel({
    required super.id,
    required super.date,
    required super.slug,
    required super.title,
    required super.content,
    required super.excerpt,
    required super.author,
    required super.featuredMedia,
    required super.categories,
    required super.tags,
    required super.customFields,
  });

  factory WorkoutModel.fromJson(Map<String, dynamic> json) {
    return WorkoutModel(
      id: json['id'],
      date: json['date'] ?? '',
      slug: json['slug'] ?? '',
      title: json['title']['rendered'] ?? '',
      content: json['content']['rendered'] ?? '',
      excerpt: json['excerpt']['rendered'] ?? '',
      author: json['author'] ?? 0,
      featuredMedia: json['featured_media'] ?? 0,
      categories: List<int>.from(json['categories'] ?? []),
      tags: List<int>.from(json['tags'] ?? []),
      customFields: json['custom_fields'] ?? {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'slug': slug,
      'title': {'rendered': title},
      'content': {'rendered': content},
      'excerpt': {'rendered': excerpt},
      'author': author,
      'featured_media': featuredMedia,
      'categories': categories,
      'tags': tags,
      'custom_fields': customFields,
    };
  }
}