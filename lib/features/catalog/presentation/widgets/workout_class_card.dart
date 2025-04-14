import 'package:flutter/material.dart';

class WorkoutClassCard extends StatelessWidget {
  final String title;
  final String duration;
  final String equipment;
  final String intensity;
  final String imageUrl;

  const WorkoutClassCard({
    super.key,
    required this.title,
    required this.duration,
    required this.equipment,
    required this.intensity,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Image.network(imageUrl, height: 140, width: double.infinity, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('$duration - $intensity'),
                Text(equipment),
              ],
            ),
          )
        ],
      ),
    );
  }
}