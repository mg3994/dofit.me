
import 'package:core/core.dart';


import 'package:l10nr/domain/entities/l10nr_entity.dart';
import 'package:l10nr/domain/repositories/l10nr_repository.dart';

class SetL10nrUseCase extends UseCase<bool, L10nrEntity> {
  final L10nrRepository repository;
const SetL10nrUseCase({required this.repository});
  
  @override
  Future<Either<Failure, bool>> call(L10nrEntity l10nrEntity) async{
    try {
      final result = await repository.setLocale(l10nrEntity);
      return Right(result);
    } catch (e) {
      return Left(CacheFailure('Unable to set locale: ${e.toString()}'));
    }
  }
  
}