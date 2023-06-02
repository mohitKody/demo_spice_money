import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spice_money/ui/utils/constants/app_constants.dart';

import '../../routing/stack.dart';
import '../theme/app_color_utils.dart';
import '../theme/text_style.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? isLeadingEnable;
  final GestureTapCallback? onLeadingPress;
  final String title;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? titleColor;
  final String? titleLogo;
  final double? loadingsize;

  const CommonAppBar(
      {Key? key,
      this.isLeadingEnable,
      this.onLeadingPress,
      this.title = '',
      this.backgroundColor,
      this.titleColor,
      this.actions,
      this.titleLogo, this.loadingsize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      leadingWidth: loadingsize,
      leading:
        Consumer(
              builder: (context, ref, child) {
                return isLeadingEnable == false
                    ? InkWell(
                        onTap: onLeadingPress ??
                            () {
                              if (ref
                                      .read(navigationStackController)
                                      .items
                                      .length >
                                  1) {
                                ref.read(navigationStackController).pop();
                              }
                              // else{
                              //   showConfirmationDialog(
                              //       context,
                              //       'Key_Exit'.localized,
                              //       'Key_AreYouSureWantToExitFromApp'.localized,
                              //       'Key_Exit',
                              //       'Key_Cancel', (isPositive) {
                              //     if(isPositive){
                              //       exit(0);
                              //     }
                              //   });
                              // }
                            },
                        child: Row(
                          children: [
                            SizedBox(
                              width: 12.w,
                            ),
                            const Icon(
                              Icons.arrow_back,
                            )
                          ],
                        ),
                      )
                    :Row(
                  children: [

                    const Icon(
                      Icons.arrow_back,
                    ),
                    Expanded(
                        child: Image.asset(
                          titleLogo!,
                          height: 50,
                        )),
                  ],
                );
              },
            ),


      elevation: 0,
      actions: actions,
      backgroundColor: backgroundColor ?? AppColors.primary,
      title: Text(title,
          textAlign: TextAlign.center,
          style: TextStyles.medium
              .copyWith(fontSize: 16.sp, color: titleColor ?? AppColors.white)),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
