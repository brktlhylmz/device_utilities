import 'dart:io';

import 'package:device_utilities/device_utilities.dart';

/// {@template device_utilities_io}
/// DeviceUtilities IO implementation
/// {@endtemplate}
DeviceUtilities get instance => _DeviceUtilitiesIo._instance;

/// {@macro device_utilities_io}
final class _DeviceUtilitiesIo extends DeviceUtilities {
  /// {@macro device_utilities_io}
  _DeviceUtilitiesIo._();

  static final _DeviceUtilitiesIo _instance = _DeviceUtilitiesIo._();
  @override
  Future<void> initialize() async {
    platformName = Platform.operatingSystem;
    final package = await getPackageInfo();
    appBuildNumber = package.buildNumber;
    appName = package.appName;
    appVersion = package.version;
    appInstalledStore = package.installerStore;
    if (platformName != null) deviceType = _deviceType();
    deviceTimeZone = DateTime.now().timeZoneOffset.inHours;
    if (Platform.isAndroid) {
      final info = await device.androidInfo;
      platformVersion = info.version.release;
      deviceModel = info.model;
      deviceName = info.device;
      deviceBrand = info.brand;
      deviceId = info.id;
    }
    if (Platform.isIOS) {
      final info = await device.iosInfo;
      platformName = info.systemName;
      platformVersion = info.systemVersion;
      deviceModel = info.utsname.machine.replaceAll(' ', '').replaceAll(',', '_');
      deviceBrand = info.name;
      deviceId = info.identifierForVendor;
    }
  }

  String _deviceType() {
    if (Platform.isAndroid || Platform.isIOS) return 'mobile';
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) return 'desktop';
    throw UnsupportedError('Platform not supported');
  }
}
