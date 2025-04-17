import 'package:packages/packages.dart' show Either, Equatable;

import '../errors/failures.dart';

abstract  class UseCase<Type, Params> {
  const UseCase();
  Future<Either<Failure, Type>> call(Params params);
}

final class NoParams extends Equatable {
  const NoParams();
  
  @override
  List<Object?> get props => [];
}

//TODO Add Pagination