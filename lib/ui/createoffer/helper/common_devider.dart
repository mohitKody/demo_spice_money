import 'package:flutter/material.dart';

import '../../utils/constants/app_constants.dart';
import '../../utils/theme/text_style.dart';

class CommonDevider extends StatelessWidget {
  const CommonDevider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 2,
            width: 90,
            decoration: const BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.white, Color(0xffD8D8D8)])),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'or',
              style: TextStyles.medium.copyWith(
                  color: Color(0xffD8D8D8),
                  fontStyle: FontStyle.italic,
                  fontSize: 14),
            ),
          ),
          Container(
            height: 2,
            width: 90,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xffD8D8D8),
              Colors.white,
            ])),
          ),
        ],
      ),
    );
  }
}
