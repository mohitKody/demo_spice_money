import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

import '../../../ui/utils/theme/app_color_utils.dart';
import '../../di/inject.dart';
import '../../session.dart';

final darkModeController = ChangeNotifierProvider.autoDispose((ref)=>  getIt<DarkModeController>());

@injectable
class DarkModeController with ChangeNotifier {
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  void updateIsDarkMode(bool fromSetting, bool value) {
    if(fromSetting){
      Session.saveLocalData(keyAppThemeDark, value);
    }
    _darkTheme = value;
    AppColors.isDarkMode = _darkTheme;
    notifyListeners();
  }
}