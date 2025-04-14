import 'package:dartz/dartz.dart';
import 'package:dofit/features/catalog/domain/entities/workout.dart';
import '../../../auth/domain/core/failure.dart';
import '../../domain/entities/category.dart';
import '../../domain/repositories/catalog_repository.dart';
import '../datasources/catalog_remote_datasource.dart';

class CatalogRepositoryImpl implements CatalogRepository {
  final CatalogRemoteDataSource remoteDataSource;

  CatalogRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Category>>> getCategories(int parentId) async {
    try {
      final categories = await remoteDataSource.getCategories(parentId);
      return Right(categories);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Workout>>> getWorkouts(int categoryId) async {
    try {
      final workouts = await remoteDataSource.getWorkouts(categoryId);
      return Right(workouts);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
