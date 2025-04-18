import 'package:core/core.dart';
import 'package:themer/domain/entities/themer_entity.dart';
import 'package:themer/domain/repositories/themer_repository.dart';


class SetThemerUseCase extends UseCase<bool, ThemerEntity> {
  final ThemerRepository repository;

  SetThemerUseCase({required this.repository});
  
  @override
  Future<Either<Failure, bool>> call(ThemerEntity params) async{
    try {
      final result = await repository.setThemer(params); // returns bool
      return Right(result); // manually wrap
    } catch (e) {
      // Wrap any error into a Failure instance
      return Left(CacheFailure('Unable to set themer: ${e.toString()}'));
    }
  }


  
}