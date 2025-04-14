// Add this to your workout_grid.dart or create a separate mock_data.dart file

import 'package:dofit/features/catalog/domain/entities/workout.dart';

class MockData {
  static Map<int, String> mockCategoryNames = {
    1: 'Fitness',
    2: 'Cardio',
    3: 'Yoga',
    4: 'Strength',
  };

  static List<Workout> getMockWorkouts() {
    return [
      Workout(
        id: 1,
        date: '2025-04-01T10:00:00',
        slug: 'aerobic-dance',
        title: 'AEROBIC DANCE',
        content: 'Full aerobic dance workout content...',
        excerpt: 'High-intensity aerobic dance workout',
        author: 101,
        featuredMedia: 2001,
        categories: [1], // Fitness
        tags: [10, 11],
        customFields: {
          'a-DoFit-Duration': '30',
          'a-DoFit-Trainer': 'VALERIA AVELLINA',
          'a-DoFit-Video': '123456789',
        },
      ),
      Workout(
        id: 2,
        date: '2025-04-02T11:00:00',
        slug: 'ashtanga-yoga',
        title: 'ASHTANGA YOGA',
        content: 'Comprehensive ashtanga yoga session...',
        excerpt: 'Traditional ashtanga yoga practice',
        author: 102,
        featuredMedia: 2002,
        categories: [3], // Yoga
        tags: [12, 13],
        customFields: {
          'a-DoFit-Duration': '45',
          'a-DoFit-Trainer': 'MARTA SCLAFANI',
          'a-DoFit-Video': '987654321',
        },
      ),
      Workout(
        id: 3,
        date: '2025-04-03T14:00:00',
        slug: 'body-tone',
        title: 'BODY TONE',
        content: 'Full body toning workout...',
        excerpt: 'Tone your entire body in 30 minutes',
        author: 103,
        featuredMedia: 2003,
        categories: [2], // Cardio
        tags: [14, 15],
        customFields: {
          'a-DoFit-Duration': '30',
          'a-DoFit-Trainer': 'GIORGIA ILARI',
          'a-DoFit-Video': '456789123',
        },
      ),
      Workout(
        id: 4,
        date: '2025-04-04T16:00:00',
        slug: 'capoeira',
        title: 'CAPOEIRA',
        content: 'Learn the basics of capoeira...',
        excerpt: 'Brazilian martial art combining dance, acrobatics, and music',
        author: 104,
        featuredMedia: 2004,
        categories: [2], // Cardio
        tags: [16, 17],
        customFields: {
          'a-DoFit-Duration': '40',
          'a-DoFit-Trainer': 'JLENIA SORTINO',
          'a-DoFit-Video': '789123456',
        },
      ),
    ];
  }
}