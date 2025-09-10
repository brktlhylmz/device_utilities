import 'package:device_info_plus/device_info_plus.dart';
import 'package:device_utilities/src/device_utilities_io.dart' if (dart.library.html) 'device_utilities_web.dart'
    as device_utilities;
import 'package:flutter/services.dart' as services;
import 'package:package_info_plus/package_info_plus.dart';

/// {@template device_utilities}
/// Device utilities
/// {@endtemplate}
abstract base class DeviceUtilities {
  /// Initialize device utilities
  Future<void> initialize();

  /// {@macro device_utilities}
  static DeviceUtilities get instance => device_utilities.instance..appFlavor = services.appFlavor;

  /// Device information
  DeviceInfoPlugin get device => DeviceInfoPlugin();

  /// Package information
  Future<PackageInfo> getPackageInfo() async {
    try {
      return await PackageInfo.fromPlatform();
    } catch (e) {
      rethrow;
    }
  }

  //* Device Information
  /// Device model information
  /// * iOS: iPhone12,3
  /// * Android: SM-G960F
  /// * Web: Chrome
  String? deviceModel;

  /// Devices unique identifier
  String? deviceId;

  /// Device name
  String? deviceName;

  /// Device type
  /// * mobile: Android or iOS
  /// * web: Web
  String? deviceType;

  /// Device brand
  /// * iOS: Apple
  /// * Android: Samsung
  /// * Web: Chrome
  String? deviceBrand;

  /// Device time zone
  int? deviceTimeZone;

  //* OS Information
  /// Operating system name
  /// * iOS: iOS
  /// * Android: Android
  /// * Web: web
  String? platformName;

  /// Operating system version
  String? platformVersion;

  //* App Information
  /// App build number
  String? appBuildNumber;

  /// App name
  String? appName;

  /// App version
  String? appVersion;

  /// App installed store
  String? appInstalledStore;

  /// App flavor
  String? appFlavor;
}
