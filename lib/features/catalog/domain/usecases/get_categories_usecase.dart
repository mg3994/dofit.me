import 'package:dartz/dartz.dart';
import '../../../auth/domain/core/failure.dart';
import '../entities/category.dart';
import '../repositories/catalog_repository.dart';

class GetCategoriesUseCase {
  final CatalogRepository repository;

  GetCategoriesUseCase(this.repository);

  Future<Either<Failure, List<Category>>> call(int parentId) {
    return repository.getCategories(parentId);
  }
}