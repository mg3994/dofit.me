import 'package:core/core.dart';
import 'package:themer/domain/entities/themer_entity.dart';
import 'package:themer/domain/repositories/themer_repository.dart';

class GetThemerUseCase extends UseCase<ThemerEntity,NoParams> {
  final ThemerRepository repository;

  GetThemerUseCase({required this.repository});
  
  @override
  Future<Either<Failure, ThemerEntity>> call(NoParams params)async {
    try {
      final themer = await repository.getThemer(); // returns ThemerEntity
      return Right(themer); // manually wrap
    } catch (e) {
      // Wrap any error into a Failure instance
      return Left(CacheFailure('Unable to fetch themer: ${e.toString()}'));
    }
  }

 
  
}