import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../framework/session.dart';
import '../../routing/navigation_stack_item.dart';
import '../../routing/stack.dart';
import '../../utils/theme/app_assets.dart';

class SplashMobile extends ConsumerStatefulWidget {
  const SplashMobile({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashMobile> createState() => _SplashMobileState();
}

class _SplashMobileState extends ConsumerState<SplashMobile> {
  ///Init
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      // int delayDuration = 3000; //3 Seconds
      // String userToken = Session.getUserAccessToken();

      // if (userToken != '') {
        // final splashScreenWatch = ref.watch(splashController);
        // await splashScreenWatch.updateDeviceTokenAPI(context);
      // }
      ref.read(navigationStackController).pushAndRemoveAll(
          const NavigationStackItem.prachar());
      // Future.delayed(Duration(milliseconds: delayDuration), () async {
      //   if (userToken.isNotEmpty) {
      //     if (mounted) {
      //       if (!(await LocationManager.instance.isDeviceGPSEnable())) {
      //         ref.read(navigationStackController).pushAndRemoveAll(
      //             const NavigationStackItem.enableLocation(
      //                 isEnableLocation: true, fromStart: true));
      //       } else if (await Geolocator.checkPermission() ==
      //               LocationPermission.denied ||
      //           await Geolocator.checkPermission() ==
      //               LocationPermission.deniedForever) {
      //         ref.read(navigationStackController).pushAndRemoveAll(
      //             const NavigationStackItem.enableLocation(
      //                 isEnableLocation: false, fromStart: true));
      //       } else {
      //         ref.read(navigationStackController).pushAndRemoveAll(
      //             const NavigationStackItem.bottomMenu(tabIndex: 0));
      //       }
      //     }
      //   } else {
      //     if (Session.getShowLanguage()) {
      //       if (mounted) {
      //         ref
      //             .read(navigationStackController)
      //             .pushAndRemoveAll(const NavigationStackItem.chooseLanguage());
      //       }
      //     } else {
      //       if (mounted) {
      //         ref
      //             .read(navigationStackController)
      //             .pushAndRemoveAll(const NavigationStackItem.signIn());
      //       }
      //     }
      //   }
      // });
    });
  }

  ///Dispose
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  ///Build
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: widgetBody());
  }

  /// Body Widget
  Widget widgetBody() {
    return Container(
        decoration: const BoxDecoration(
          color: Colors.black
        ),
        height: double.infinity,
        width: double.infinity,
        child: Image.asset(AppAssets.icSplashLogo));
  }
}
