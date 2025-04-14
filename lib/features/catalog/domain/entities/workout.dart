class Workout {
  final int id;
  final String date;
  final String slug;
  final String title;
  final String content;
  final String excerpt;
  final int author;
  final int featuredMedia;
  final List<int> categories;
  final List<int> tags;
  final Map<String, dynamic> customFields;

  Workout({
    required this.id,
    required this.date,
    required this.slug,
    required this.title,
    required this.content,
    required this.excerpt,
    required this.author,
    required this.featuredMedia,
    required this.categories,
    required this.tags,
    required this.customFields,
  });
}