import 'package:egystore/Controllers/lang_controller.dart';
import 'package:egystore/Helper/fonts_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class HomeAppBarBack extends StatelessWidget {
  HomeAppBarBack({Key? key, required this.title}) : super(key: key);
  final String title;
  final selectedLang = Get.find<LangController>().selectedLang;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black,
      automaticallyImplyLeading: false,
      centerTitle: true,
      pinned: true,
      title: Text(
        title.tr,
        style: titleStyle700(),
      ),
      leading: selectedLang == 'en'
          ? InkWell(
              onTap: () => Navigator.pop(context),
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: SizedBox(
                  width: 22.w,
                  height: 22.w,
                  child: Image.asset(
                    'assets/Icons/arrow-square-ar.png',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            )
          : SizedBox.shrink(),
      actions: [
        selectedLang == 'ar'
            ? InkWell(
                onTap: () => Navigator.pop(context),
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: SizedBox(
                    width: 22.w,
                    height: 22.w,
                    child: Image.asset(
                      'assets/Icons/arrow-square-ar.png',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
