// import 'package:packages/packages.dart';
// part 'auth_exception.freezed.dart';

// @freezed
// class AuthException implements Exception with _$AuthException {
//     const factory AuthException.serverError() = _ServerError;
//     const factory AuthException.unauthorized() = _Unauthorized;
//     const factory AuthException.unknown() = _Unknown;
//     const factory AuthException.internetConnectionUnavailable() =
//         _InternetConnectionUnavailable;
//     const factory AuthException.wrongEmailOrPass() =
//         _WrongEmailOrPass;
// }

// // extension AuthExceptionX on AuthException {
// //     String get description {
// //         if (this is _Unauthorized) {
// //             return "Sorry, your session has expired. Please sign in again";
// //         } else if (this is _InternetConnectionUnavailable) {
// //             return "Sorry, there’s a problem with your internet connection. Please check your connection and try again.";
// //         } else if (this is _WrongEmailOrPass) {
// //             return "An email or password are incorrect";
// //         } else {
// //             return "Sorry, there’s a problem with the server connection. Please try again later.";
// //         }
// //     }
// //     bool get isUnauthorized => this is _Unauthorized;
// // }

// // extension AuthExceptionX on AuthException {
// //     String get description => maybeWhen(unauthorized: () => "Sorry, your session has expired. Please sign in again", internetConnectionUnavailable: () => "Sorry, there’s a problem with the server connection. Please try again later.", wrongEmailOrPass: () => "An email or password are incorrect", orElse: () => "Oh, an error occured, please try again later");
// //     bool get isUnauthorized => this is _Unauthorized;
// // } 