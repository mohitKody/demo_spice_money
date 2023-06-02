import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:spice_money/ui/prachar/mobile/prachar_mobile.dart';
import 'package:spice_money/ui/prachar/web/prachar_web.dart';

import '../splash/mobile/splash_mobile.dart';
import '../splash/web/splash_web.dart';

class Prachar extends StatelessWidget {
  const Prachar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
        mobile: (BuildContext context) {
          return const PracharMobile();
        },
        desktop: (BuildContext context) {
          return const PracharWeb();
        }
    );
  }
}
