import 'package:egystore/Controllers/auth_controller.dart';
import 'package:egystore/Controllers/lang_controller.dart';
import 'package:egystore/Helper/fonts_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  SideMenu({Key? key}) : super(key: key);
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        controller: _controller,
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            DrawerHeader(

              child: Center(
                child: Text(
                  'Caligo',
                  style: cairoW500(color: Colors.white, size: 24),
                ),
              ),
            ),
            DrawerListTile(
              title: 'dashboard'.tr,
              svgSrc: "assets/Icons/menu_dashbord.svg",
              press: () {
                debugPrint('Dashboard');
              },
            ),
            DrawerListTile(
              title: 'schedule'.tr,
              svgSrc: "assets/Icons/menu_tran.svg",
              press: () {
                debugPrint('Schedule');
              },
            ),
            DrawerListTile(
              title: 'courses'.tr,
              svgSrc: "assets/Icons/menu_task.svg",
              press: () {
                debugPrint('Courses');
              },
            ),
            DrawerListTile(
              title: 'gradeBook'.tr,
              svgSrc: "assets/Icons/menu_doc.svg",
              press: () {
                debugPrint('Gradebook');
              },
            ),
            DrawerListTile(
              title: 'language'.tr,
              svgSrc: "assets/Icons/menu_profile.svg",
              press: () {
                showDialog(
                  context: context,
                  builder: (context) => GetBuilder<LangController>(
                    builder: (controller) => SimpleDialog(
                      backgroundColor: Color(0xFF2F2F2F),
                      children: [
                        Text(
                          'change-language'.tr,
                          textAlign: TextAlign.center,
                          style: titleStyle600(color: Colors.white),
                        ),
                        RadioListTile(
                          value: 'ar',
                          title: Text(
                            'ar'.tr,
                            style: titleStyle400(color: Colors.white),
                          ),
                          groupValue: controller.selectedLang,
                          onChanged: (value) => controller.changeLang(value),
                        ),
                        RadioListTile(
                          value: 'en',
                          title: Text(
                            'en'.tr,
                            style: titleStyle400(color: Colors.white),
                          ),
                          groupValue: controller.selectedLang,
                          onChanged: (value) => controller.changeLang(value),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            DrawerListTile(
              title: 'logout'.tr,
              svgSrc: "assets/Icons/menu_setting.svg",
              press: () {
                Provider.of<AuthController>(context, listen: false).logout(context: context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({Key? key, required this.title, required this.svgSrc, required this.press})
      : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: cairoW500(color: Colors.white54),
      ),
    );
  }
}
