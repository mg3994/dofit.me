import 'package:dartz/dartz.dart';
import '../../../auth/domain/core/failure.dart';
import '../entities/workout.dart';
import '../repositories/catalog_repository.dart';

class GetWorkoutsUseCase {
  final CatalogRepository repository;

  GetWorkoutsUseCase(this.repository);

  Future<Either<Failure, List<Workout>>> call(int categoryId) {
    return repository.getWorkouts(categoryId);
  }
}