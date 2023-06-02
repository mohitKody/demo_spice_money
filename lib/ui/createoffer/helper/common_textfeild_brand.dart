import 'package:flutter/material.dart';

import '../../utils/theme/app_color_utils.dart';
import '../../utils/theme/text_style.dart';

class CommonTextfeildBrand extends StatelessWidget {
  final FocusNode myFocusNode;
  final String labeltext;
  final TextEditingController controller;

  const CommonTextfeildBrand({Key? key, required this.myFocusNode, required this.labeltext, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText: false,
        focusNode: myFocusNode,
        controller: controller,
      keyboardType: TextInputType.multiline,
      minLines: 1,//Normal textInputField will be displayed
      maxLines: 5,
        style: TextStyles.medium.copyWith(
          color: AppColors.black,
          fontSize: 15.0,
        ),
        decoration: InputDecoration(

            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(5)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: AppColors.primary, width: 1.0),
                borderRadius: BorderRadius.circular(5)),
            //labelText: title ,  // you can change this with the top text  like you want
            hintText: labeltext,

            hintStyle: TextStyles.medium
                .copyWith(fontSize: 14.0, color: AppColors.primary),
            border: InputBorder.none,
            fillColor: const Color(0xfff3f3f4),
            filled: true));
  }
}
