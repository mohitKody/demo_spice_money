import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spice_money/ui/utils/constants/app_constants.dart';
import 'package:spice_money/ui/utils/theme/app_assets.dart';
import 'package:spice_money/ui/utils/theme/app_color_utils.dart';
import 'dart:math' as math;

import '../../routing/navigation_stack_item.dart';
import '../../routing/stack.dart';
import '../../utils/theme/text_style.dart';
import '../../utils/widget/common_button_arrow.dart';

class PracharMobile extends ConsumerStatefulWidget {
  const PracharMobile({Key? key}) : super(key: key);

  @override
  ConsumerState<PracharMobile> createState() => _PracharMobileState();
}

class _PracharMobileState extends ConsumerState<PracharMobile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
    //   _modalBottomSheetMenu();
    // });
  }

  ///Build
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.dark,
          body: _widgetBody(),
        ),
        Positioned(bottom: 0, child: _bottomBody()),
      ],
    );
  }

  Widget _widgetBody() {
    return Container(
      child: Image.asset(AppAssets.backgroundImage),
    );
  }

  Widget _bottomBody() {
    return Stack(
      children: [
        CustomPaint(
          painter: MyPainter(),
          size: Size(screenWidth(context), screenHeight(context) / 2),
        ),
        Container(
            height: screenHeight(context) / 2,
            width: screenWidth(context),
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 38.0, bottom: 32.0),
                      child: Image.asset(AppAssets.pracharTitle),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 19.0),
                      child: Text(
                        prachr_title,
                        textAlign: TextAlign.center,
                        style: TextStyles.regular.copyWith(
                          fontSize: 20.sp,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 29.0),
                      child: Text(
                        prachr_subtitle,
                        textAlign: TextAlign.center,
                        style: TextStyles.regular.copyWith(
                          fontSize: 16.sp,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                // ignore: prefer_const_constructors
                Positioned(
                    bottom: 0,
                    child:  CommonButtonArrow(
                      onTap: (){
                        ref.read(navigationStackController).push(
                            const NavigationStackItem.createoffer());
                      },
                      title: 'Create an offer',
                    ))
              ],
            )),
      ],
    );
  }
}

// This is the Painter class
class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.blue;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height / 2, size.width / 2),
        height: size.height,
        width: size.width,
      ),
      math.pi,
      math.pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
