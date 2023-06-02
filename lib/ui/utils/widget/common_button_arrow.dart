import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spice_money/ui/utils/constants/app_constants.dart';

import '../theme/app_color_utils.dart';
import '../theme/text_style.dart';

class CommonButtonArrow extends StatelessWidget {
  final String title;
  final GestureTapCallback? onTap;

  const CommonButtonArrow({Key? key, required this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenWidth(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                AppColors.primary,
                AppColors.primary_light,
              ]),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyles.medium.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.white,
                ),
              ),
              Positioned(
                  right: 40,
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
