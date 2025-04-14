import 'package:flutter/material.dart';
import '../../domain/entities/workout.dart';

class WorkoutGrid extends StatelessWidget {
  final List<Workout> workouts;
  final Map<int, String> categoryNames; // Map category IDs to readable names

  const WorkoutGrid({
    super.key,
    required this.workouts,
    required this.categoryNames,
  });

  // Helper method to get trainer name from customFields
  String _getTrainer(Map<String, dynamic> customFields) {
    return customFields['a-DoFit-Trainer'] ?? 'Unknown Trainer';
  }

  // Helper method to get workout info from customFields
  String _getWorkoutInfo(Workout workout) {
    final duration = workout.customFields['a-DoFit-Duration'] ?? '0';
    return '$duration min workout';
  }

  // Helper method to get primary category name
  String _getPrimaryCategory(List<int> categories) {
    if (categories.isEmpty) return 'Uncategorized';
    final categoryId = categories.first;
    return categoryNames[categoryId] ?? 'Uncategorized';
  }

   // TODO: How to get image for workout?
  String _getImageUrl(int featuredMediaId) {
    
    return 'https://www.dofit.me/wp-content/uploads/media/$featuredMediaId.jpg';
  }

  @override
  Widget build(BuildContext context) {
    // Group workouts by category
    final Map<String, List<Workout>> grouped = {};
    for (var workout in workouts) {
      final categoryName = _getPrimaryCategory(workout.categories);
      grouped.putIfAbsent(categoryName, () => []).add(workout);
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: grouped.entries.map((entry) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              entry.key,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: entry.value.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                final workout = entry.value[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          _getImageUrl(workout.featuredMedia),
                          fit: BoxFit.cover,
                          width: double.infinity,
                          // Show placeholder if image fails to load
                          errorBuilder: (context, _, __) => Container(
                            color: Colors.grey.shade800,
                            child: const Center(child: Icon(Icons.image_not_supported)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      workout.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.pinkAccent,
                      ),
                    ),
                    Text(
                      _getWorkoutInfo(workout),
                      style: const TextStyle(fontSize: 12),
                    ),
                    Text(
                      _getTrainer(workout.customFields),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 32),
          ],
        );
      }).toList(),
    );
  }
}