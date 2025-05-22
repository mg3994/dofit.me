import 'package:freezed_annotation/freezed_annotation.dart';

part '../api_response.freezed.dart';
part '../api_response.g.dart';
// serializable 
@freezed
class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse({
    required String code,
    required String message,
    T? data,
  }) = _ApiResponse<T>;

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$ApiResponseFromJson(json, fromJsonT);
}



// @RestApi()
// abstract class ApiServices {
//   factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

//   @GET("/users/{id}")
//   Future<ApiResponse<UserModel>> getUser(@Path("id") String id);
// }





// class UserRepository {
//   final ApiServices api;

//   UserRepository(this.api);

//   Future<Either<Failure, UserModel>> getUser(String id) async {
//     try {
//       final response = await api.getUser(id);

//       if (response.code != 'success') {
//         return Left(Failure.apiError(response.message));
//       }

//       final user = response.data;
//       if (user == null) return Left(const Failure.emptyData());

//       return Right(user);
//     } on DioException catch (e) {
//       return Left(_handleDioError(e));
//     } catch (e) {
//       return const Left(Failure.unknown());
//     }
//   }

//   Failure _handleDioError(DioException e) {
//     final statusCode = e.response?.statusCode;

//     if (statusCode == 401) {
//       return const Failure.unauthorized();
//     }

//     return Failure.server(e.response?.data['message'] ?? 'Unknown server error');
//   }
// }
