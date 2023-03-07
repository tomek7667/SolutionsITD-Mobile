import 'dart:convert';
import 'dart:io';

import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';
import 'package:solutions_itd_mobile/MainPage/models/device_info.dart';
import 'package:solutions_itd_mobile/MainPage/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class AppData {
  User? user;
  String? accessToken;
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  DeviceInfo? deviceInfo;

  Future<void> initialize() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final userJson = prefs.getString('user');
      accessToken = prefs.getString('access_oken');
      if (userJson != null) {
        final data = json.decode(userJson);
        user = User.fromJson(data['data']);
      } else if (userJson != null) {
        // await api.fetchUser();
      }
      await _setDeviceInfo();
    } catch (err) {}
  }

  Future<void> setUser(UserProfile user) async {
    this.user = User(oAuthUserProfile: user);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', json.encode(this.user!.toJson()));
  }

  Future<void> setAccessToken(String accessToken) async {
    this.accessToken = accessToken;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', accessToken);
  }

  Future<void> _setDeviceInfo() async {
    final deviceId = await _findOrCreateDeviceId();
    try {
      if (Platform.isAndroid) {
        deviceInfo =
            _readAndroidBuildData(await deviceInfoPlugin.androidInfo, deviceId);
      } else if (Platform.isIOS) {
        deviceInfo =
            _readIosDeviceInfo(await deviceInfoPlugin.iosInfo, deviceId);
      } else {
        deviceInfo = DeviceInfo(
          platform: 'unknown',
          model: 'unknown',
          os: 'unknown',
          deviceId: deviceId,
        );
      }
    } on PlatformException {
      deviceInfo = DeviceInfo(
        platform: 'unknown',
        model: 'unknown',
        os: 'unknown',
        deviceId: deviceId,
      );
    }
  }

  Future<String> _findOrCreateDeviceId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var deviceId = prefs.getString('device_id');
    if (deviceId == null) {
      deviceId = const Uuid().v4();
      await prefs.setString('device_id', deviceId);
    }
    return deviceId;
  }

  DeviceInfo _readAndroidBuildData(AndroidDeviceInfo build, String deviceId) {
    return DeviceInfo(
      platform: 'android',
      os: build.version.baseOS,
      model: build.hardware,
      deviceId: deviceId,
    );
  }

  DeviceInfo _readIosDeviceInfo(IosDeviceInfo data, String deviceId) {
    return DeviceInfo(
      platform: 'ios',
      model: data.model,
      os: data.systemVersion,
      deviceId: deviceId,
    );
  }
}

final AppData appData = AppData();
