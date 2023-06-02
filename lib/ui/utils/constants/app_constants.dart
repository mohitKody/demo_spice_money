import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const String appName = 'Spice Money';

const String prachr_title = 'प्रचार द्वारा अपने ऑफर्स खुद बनायें और अपना बिज़नेस बढ़ायें';
const String prachr_subtitle = 'अपने ऑफर्स WhatsApp और Facebook पर शेयर करें और तरक्की की राह पर आगे बढ़ें';


bool getIsIOSPlatform() => Platform.isIOS;

bool getIsAppleSignInSupport() => (iosVersion >= 13);
int iosVersion = 11;
int maxMobileLength = 15;
int maxPasswordLength = 15;
int minProductTitleLength = 10;
int minProductDescriptionLength = 10;
int maxOtpTimerSeconds = 30;
int maxOtpLength = 6;
int maxPinCode = 6;
String pageCount15 = '15';
String pageCount100000 = '100000';
RegExp mobileRegEx = RegExp(r'[0-9]');
// bool saveForm = false;
/// global context and ref for - used for unauthorized token
BuildContext? globalContext;
WidgetRef? globalRef;


String getDeviceType() => getIsIOSPlatform() ? 'ios' : 'android';

enum ScreenName {
  none,
  splashScreen,
}

enum AdsStatus { active, pending, inactive }

hideKeyboard(BuildContext context) {
  FocusScope.of(context).unfocus();
}

 screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
 screenWidth(BuildContext context) => MediaQuery.of(context).size.width;