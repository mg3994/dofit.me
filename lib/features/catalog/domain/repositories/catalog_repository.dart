import 'package:dartz/dartz.dart';
import 'package:dofit/features/catalog/domain/entities/workout.dart';
import '../../../auth/domain/core/failure.dart';
import '../entities/category.dart';

abstract class CatalogRepository {
  Future<Either<Failure, List<Category>>> getCategories(int parentId);
    Future<Either<Failure, List<Workout>>> getWorkouts(int categoryId);

}