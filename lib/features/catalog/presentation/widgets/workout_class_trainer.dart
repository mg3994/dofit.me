import 'package:flutter/material.dart';

class WorkoutClassTrainer extends StatelessWidget {
  const WorkoutClassTrainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 48,
          backgroundImage: NetworkImage('https://example.com/trainer.jpg'),
        ),
        const SizedBox(height: 12),
        const Text('Anna Rivieri', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        TextButton(
          onPressed: () {
            // Navigate to trainer workouts
          },
          child: const Text('TUTTI GLI ALLENAMENTI DI ANNA »'),
        ),
      ],
    );
  }
}