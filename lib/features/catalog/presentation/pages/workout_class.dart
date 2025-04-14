import 'package:dofit/features/catalog/presentation/widgets/workout_class_header.dart';
import 'package:dofit/features/catalog/presentation/widgets/workout_class_list.dart';
import 'package:dofit/features/catalog/presentation/widgets/workout_class_trainer.dart';
import 'package:dofit/features/catalog/presentation/widgets/workout_class_video.dart';
import 'package:flutter/material.dart';

class WorkoutClass extends StatelessWidget {
  const WorkoutClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              WorkoutClassHeader(),
              SizedBox(height: 20),
              WorkoutClassList(),
              SizedBox(height: 20),
              WorkoutClassVideo(),
              SizedBox(height: 20),
              WorkoutClassTrainer(),
            ],
          ),
        ),
      ),
    );
  }
}