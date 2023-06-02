import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:spice_money/ui/splash/web/splash_web.dart';

import 'mobile/splash_mobile.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  ///Build Override
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
        mobile: (BuildContext context) {
          return const SplashMobile();
        },
        desktop: (BuildContext context) {
          return const SplashWeb();
        }
    );
  }
}

