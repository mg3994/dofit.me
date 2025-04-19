import 'package:packages/packages.dart' show Equatable;
export 'exceptions/auth_exceptions.dart';

// @Equatable(stringify: true) // stringify for above use case
final class ServerException extends Equatable  implements Exception {
  const ServerException();
  @override
  List<Object> get props => [];
}

// // @Equatable(stringify: true) // stringify for above use case
// final class CacheException implements Exception {
//   const CacheException();
// }

// // @Equatable(stringify: true) // stringify for above use case
// final class AuthException implements Exception {
//   const AuthException();
// }

// // @Equatable(stringify: true) // stringify for above use case
// final class EmptyException implements Exception {
//   const EmptyException();
// }

// // @Equatable(stringify: true) // stringify for above use case
// final class DuplicateEmailException implements Exception {
//   const DuplicateEmailException();
// }
