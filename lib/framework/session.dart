
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

const String keyAppLanguage = 'keyAppLanguage';
const String keyIsOnBoardingShowed = 'keyIsOnBoardingShowed';
const String keyUserAuthToken = 'keyUserAuthToken';
const String keyDeviceId = 'keyDeviceId';
const String keyUserRefreshToken = 'keyUserRefreshToken';
const String keyDeviceFCMToken = 'keyDeviceFCMToken';
const String keyAppThemeDark = 'keyAppThemeDark';
const String isGuestUser = 'keyIsGuestUser';
const String showLanguageScreen = 'keyShowLanguageScreen';
class Session  {

  Session._();

  static var userBox = Hive.box('userBox');

  static String getUserAccessToken() => (userBox.get(keyUserAuthToken) ?? '');

  static String getAppLanguage() => (userBox.get(keyAppLanguage) ?? 'en');

  static bool getIsOnBoardingShowed() => (userBox.get(keyIsOnBoardingShowed) ?? false);

  static String getDeviceID() => (userBox.get(keyDeviceId) ?? '');

  static String getDeviceFCMToken() => (userBox.get(keyDeviceFCMToken) ?? '123456');

  static bool? getIsAppThemeDark() => userBox.get(keyAppThemeDark,defaultValue: null);

  static bool getIsGuestUser() => getUserAccessToken().isEmpty;

  static bool getShowLanguage() => userBox.get(showLanguageScreen,defaultValue: true);


  // //Save Local Data
  static saveLocalData(String key, value) {
    userBox.put(key, value);
    if (kDebugMode) {
      print('$key $value saved in local data');
    }
  }
}