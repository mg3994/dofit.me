import 'package:flutter/material.dart';

class WorkoutClassVideo extends StatelessWidget {
  const WorkoutClassVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.black12,
        ),
        child: const Center(child: Text('Video player here')),
      ),
    );
  }
}