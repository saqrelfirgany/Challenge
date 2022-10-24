import 'package:egystore/Controllers/lang_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';

class ArWhiteBackButton extends StatelessWidget {
  ArWhiteBackButton({Key? key}) : super(key: key);
  final selectedLang = Get.find<LangController>().selectedLang;

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      top: 32.h,
      child: InkWell(
        onTap: () => Navigator.pop(context),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: SizedBox(
            width: 22.w,
            height: 22.w,
            child: Image.asset(
              selectedLang == 'ar'
                  ? 'assets/Icons/arrow-square-left.png'
                  : 'assets/Icons/arrow-square-ar.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
