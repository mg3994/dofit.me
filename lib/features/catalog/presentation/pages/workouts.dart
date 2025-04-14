import 'package:dofit/features/catalog/presentation/widgets/mock_data.dart';
import 'package:dofit/features/catalog/presentation/widgets/workout_grid.dart';
import 'package:flutter/material.dart';

class Workouts extends StatelessWidget {
  const Workouts({super.key});

  @override
  Widget build(BuildContext context) {
    final mockWorkouts = MockData.getMockWorkouts();
    return Scaffold(
      appBar: AppBar(title: const Text('Palestra')),
      body: Center(
        child: WorkoutGrid(
          workouts: mockWorkouts,
          categoryNames: MockData.mockCategoryNames,
        ),
      ),
    );
  }
}
