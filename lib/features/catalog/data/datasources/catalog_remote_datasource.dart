import 'dart:convert';
import 'package:dofit/config.dart';
import 'package:dofit/features/catalog/data/models/workout_model.dart';
import 'package:http/http.dart' as http;
import '../../../../core/api/api_client.dart';
import '../models/category_model.dart';

abstract class CatalogRemoteDataSource {
  Future<List<CategoryModel>> getCategories(int parentId);
  Future<List<WorkoutModel>> getWorkouts(int categoryId);
}

class CatalogRemoteDataSourceImpl implements CatalogRemoteDataSource {
  final http.Client client;
  final AppConfig config;
  final ApiClient apiClient;

  CatalogRemoteDataSourceImpl({
    required this.client,
    required this.config,
    required this.apiClient,
  });

  @override
  Future<List<CategoryModel>> getCategories(int parentId) async {
    try {
      final response = await apiClient.get(
        '/wp-json/wp/v2/categories?parent=$parentId&per_page=100',
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => CategoryModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load categories: ${response.body}');
      }
    } catch (e) {
      throw Exception('Failed to load categories: $e');
    }
  }

  @override
  Future<List<WorkoutModel>> getWorkouts(int categoryId) async {
    try {
      final response = await apiClient.get(
        '/wp-json/wp/v2/workout?categories=$categoryId&per_page=100',
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => WorkoutModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load workouts: ${response.body}');
      }
    } catch (e) {
      throw Exception('Failed to load workouts: $e');
    }
  }
}
