import 'package:egystore/Controllers/auth_controller.dart';
import 'package:egystore/Helper/decoration_helper.dart';
import 'package:egystore/Helper/fonts_helper.dart';
import 'package:egystore/Screens/SharedComponents/FormField/default_field.dart';
import 'package:egystore/Screens/SharedComponents/net_image.dart';
import 'package:egystore/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthController _authController;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() {
    _authController = Provider.of<AuthController>(context, listen: false);
    _authController.phoneController.clear();
    _authController.passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Responsive.isMobile(context) ? 16.w : 80.w),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 80.h),
              DefaultFormField(
                hint: 'phone',
                controller: _authController.phoneController,
              ),
              SizedBox(height: 8.h),
              DefaultFormField(
                hint: 'password',
                controller: _authController.passwordController,
              ),
              SizedBox(height: 16.h),
              InkWell(
                // onTap: () => fadNavigate(context, ForgetScreen()),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'forgetPassword'.tr,
                    style: cairoW600(color: Color(0xFF292D32), size: 12),
                  ),
                ),
              ),
              SizedBox(height: 38.h),
              Consumer<AuthController>(
                builder: (context, authController, child) => authController.loading
                    ? SizedBox(
                        width: 320.w,
                        height: 50.h,
                        child: Loader(),
                      )
                    : InkWell(
                        onTap: () => _authController.login(context: context),
                        child: Container(
                          width: 320.w,
                          height: 50.h,
                          decoration: decorationRadius(color: Colors.black),
                          child: Center(
                            child: Text(
                              'signIn'.tr,
                              style: titleStyle800(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
              ),
              SizedBox(height: 16.h),
              InkWell(
                // onTap: () => fadNavigate(context, RegisterScreen()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'haveNoAcc'.tr,
                      style: cairoW600(color: Color(0xFF292D32), size: 12),
                    ),
                    Text(
                      'createAcc'.tr,
                      style: cairoW600(color: Color(0xFF292D32), size: 12).copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 80.w,
                    height: 4.h,
                    decoration: decorationRadius(color: Colors.black),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      'or'.tr,
                      style: cairoW600(color: Colors.black, size: 12),
                    ),
                  ),
                  Container(
                    width: 80.w,
                    height: 4.h,
                    decoration: decorationRadius(color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 40.w,
                    height: 40.w,
                    child: Image.asset(
                      'assets/Icons/intro/google.png',
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Container(
                    width: 40.w,
                    height: 40.w,
                    child: Image.asset(
                      'assets/Icons/intro/apple.png',
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Container(
                    width: 40.w,
                    height: 40.w,
                    child: Image.asset(
                      'assets/Icons/intro/facebook.png',
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
