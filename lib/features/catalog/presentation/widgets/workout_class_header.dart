import 'package:flutter/material.dart';

class WorkoutClassHeader extends StatelessWidget {
  const WorkoutClassHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'GLUTEI DI MARMO',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'In questo corso andremo a lavorare principalmente sulla parte bassa del corpo...',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.favorite_border),
          onPressed: () {
            // Add to favorite logic
          },
        ),
      ],
    );
  }
}
