import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_constants.dart';
import '../theme/app_color_utils.dart';
import '../theme/text_style.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final GestureTapCallback? onTap;
  final bool? isweb;

  const CommonButton({Key? key, required this.title, this.onTap, this.isweb})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: isweb!
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 100),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.primaryGreen),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 57),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyles.medium.copyWith(
                        fontSize: 16.sp,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Container(
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
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 57),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyles.medium.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
    );
  }
}
