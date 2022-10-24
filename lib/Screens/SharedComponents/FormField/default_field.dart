import 'package:egystore/Helper/decoration_helper.dart';
import 'package:egystore/Helper/fonts_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class DefaultFormField extends StatelessWidget {
  const DefaultFormField({
    Key? key,
    required this.hint,
    required this.controller,
  }) : super(key: key);
  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328.w,
      height: 46.h,
      decoration: decorationRadius(),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          hintText: hint.tr,
          hintStyle: cairoW400(color: Color(0xFFB3B3B3)),
          contentPadding: EdgeInsetsDirectional.only(
            start: 16,
            end: 16,
            bottom: 6.h,
          ),
        ),
      ),
    );
  }
}
