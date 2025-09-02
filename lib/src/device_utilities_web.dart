import 'package:device_utilities/device_utilities.dart';

/// {@template device_utilities_web}
/// DeviceUtilities Web implementation
/// {@endtemplate}
DeviceUtilities get instance => _DeviceUtilitiesWeb._instance;

/// {@macro device_utilities_web}
final class _DeviceUtilitiesWeb extends DeviceUtilities {
  /// {@macro device_utilities_web}
  _DeviceUtilitiesWeb._();

  static final _DeviceUtilitiesWeb _instance = _DeviceUtilitiesWeb._();

  @override
  Future<void> initialize() async {
    platformName = 'web';
    final package = await getPackageInfo();
    appBuildNumber = package.buildNumber;
    appName = package.appName;
    appVersion = package.version;
    appInstalledStore = package.installerStore;
    final info = await device.webBrowserInfo;
    platformName = info.browserName.name;
    platformVersion = info.appVersion;
    deviceModel = info.platform;
    deviceBrand = info.vendor;
    deviceId = info.userAgent;
    deviceTimeZone = DateTime.now().timeZoneOffset.inHours;
    deviceType = 'web';

  }
}
