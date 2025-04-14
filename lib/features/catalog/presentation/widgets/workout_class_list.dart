import 'package:dofit/features/catalog/presentation/widgets/workout_class_card.dart';
import 'package:flutter/material.dart';

class WorkoutClassList extends StatelessWidget {
  const WorkoutClassList({super.key});

  @override
  Widget build(BuildContext context) {
    // Example mock list
    final workouts = [
      {
        'title': 'GLUTEI DI MARMO 01',
        'duration': '30\'',
        'equipment': 'Loopband',
        'intensity': 'INTENSO',
        'imageUrl': 'https://example.com/preview1.jpg'
      },
    ];

    return Column(
      children: workouts.map((w) => WorkoutClassCard(
        title: w['title']!,
        duration: w['duration']!,
        equipment: w['equipment']!,
        intensity: w['intensity']!,
        imageUrl: w['imageUrl']!,
        
      )).toList(),
    );
  }
}