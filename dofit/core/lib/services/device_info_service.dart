import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DeviceInfoService {
  static final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  static Future<String> getUserAgent() async {
    String model = 'Unknown';
    if (Platform.isAndroid) {
      final info = await _deviceInfo.androidInfo;
      model = '${info.manufacturer} ${info.model}';
    } else if (Platform.isIOS) {
      final info = await _deviceInfo.iosInfo;
      model = '${info.name} ${info.utsname.machine}';
    }

    final packageInfo = await PackageInfo.fromPlatform();
    final appName = packageInfo.appName;         // e.g., DoFitApp
    // final version = packageInfo.version;         // e.g., 1.0.0

    return '$model-$appName';///$version (Flutter)
  }
}
