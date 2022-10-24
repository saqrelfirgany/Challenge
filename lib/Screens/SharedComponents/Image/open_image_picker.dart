import 'package:egystore/Helper/fonts_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';

Future<dynamic> openImagePicker({bool isOnePop = false}) {
  return Get.bottomSheet(
    StatefulBuilder(
      builder: (context, setState) {
        return Container(
          // height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(16.r),
              topEnd: Radius.circular(16.r),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 16.h),
              Text(
                'اضافة صورة',
                style: titleStyle400(color: Colors.black),
              ),
              SizedBox(height: 16.h),
              // cartController.isLoadingImage
              //     ? Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           loader,
              //         ],
              //       )
              //     :
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton.icon(
                    icon: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red.shade900,
                      shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                    label: Text(
                      'استخدم الكاميرا',
                      style: cairoW400(color: Colors.white),
                    ),
                    onPressed: () {
                      // controller.getImage(ImageSource.camera, context, isOnePop);
                      // Navigator.of(context).pop();
                    },
                  ),
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red.shade900,
                      shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                    icon: const Icon(
                      Icons.camera,
                      color: Colors.white,
                    ),
                    label: Text(
                      'استخدم المعرض',
                      style: cairoW400(color: Colors.white),
                    ),
                    onPressed: () {
                      // controller.getImage(ImageSource.gallery, context, isOnePop);
                    },
                  ),
                ],
              ),
              SizedBox(height: 24.h),
            ],
          ),
        );
      },
    ),
  );
}
