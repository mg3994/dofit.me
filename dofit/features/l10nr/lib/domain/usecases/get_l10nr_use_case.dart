import 'package:core/core.dart';
import 'package:l10nr/domain/entities/l10nr_entity.dart';
import 'package:l10nr/domain/repositories/l10nr_repository.dart';

class GetL10nrUseCase extends UseCase<L10nrEntity, NoParams> {
  final L10nrRepository repository;

  const GetL10nrUseCase({required this.repository});

  @override
  Future<Either<Failure, L10nrEntity>> call(NoParams noParams) async {
    try {
      final l10nr = await repository.getLocale();
      return Right(l10nr);
    } catch (e) {
      return Left(CacheFailure('Unable to fetch locale: ${e.toString()}'));
    }
  }
}
