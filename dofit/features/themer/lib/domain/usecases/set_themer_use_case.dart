import 'package:core/core.dart';
import 'package:themer/domain/entities/themer_entity.dart';
import 'package:themer/domain/repositories/themer_repository.dart';


class SetThemerUseCase extends UseCase<bool, ThemerEntity> {
  final ThemerRepository repository;

 const SetThemerUseCase({required this.repository});
  
  @override
  Future<Either<Failure, bool>> call(ThemerEntity themerEntity) async{
    try {
      final result = await repository.setThemer(themerEntity); // returns bool
      return Right(result); // manually wrap
    } catch (e) {
      // Wrap any error into a Failure instance
      return Left(CacheFailure('Unable to set themer: ${e.toString()}'));
    }
  }


  
}