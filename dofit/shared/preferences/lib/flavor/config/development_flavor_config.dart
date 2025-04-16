part of '../config.dart';

// class DevelopmentConfig implements FlavorConfig {
//   const DevelopmentConfig();
//   @override
//   String get appName => "[DEV] Antinna";

//   @override
//   String get baseUrl => 'https://dev.example.com';

//   @override
//   final flavor = Flavor.development;
// }

final class _DevelopmentFlavorConfig extends FlavorConfig {
  const _DevelopmentFlavorConfig()
      : super._internal(
            '[DEV] DoFit', 'https://dofit.me', Flavor.development,'AlOp7lBkcFRdJnXFkGcBHwM9I9TJMMgr',false);
}