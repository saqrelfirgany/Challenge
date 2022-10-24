import 'package:badges/badges.dart';
import 'package:egystore/Controllers/MenuController.dart';
import 'package:egystore/Helper/decoration_helper.dart';
import 'package:egystore/Helper/fonts_helper.dart';
import 'package:egystore/Helper/helper.dart';
import 'package:egystore/theme/theme.dart';
import 'package:egystore/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:provider/src/provider.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            onPressed: () {
              context.read<MenuController>().controlMenu();
            },
            icon: Icon(Icons.menu, color: Colors.black),
          ),
        Text(
          'welcome'.tr + '${Helper.userName}',
          style: cairoW500(color: Colors.black, size: Responsive.isMobile(context) ? 16 : 24),
        ),
        Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        Expanded(child: SearchField()),

        !Responsive.isMobile(context)
            ? Container(
                margin: EdgeInsets.only(left: defaultPadding),
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding,
                  vertical: defaultPadding / 2,
                ),
                child: Row(
                  children: [
                    Badge(
                      badgeContent: Text(
                        '3',
                        style: cairoW400(color: Colors.white, size: 12),
                      ),
                      child: Icon(Icons.add_alert_rounded, size: 30, color: Colors.blue.shade900),
                    ),
                    SizedBox(width: defaultPadding),
                    Badge(
                      badgeContent: Text(
                        '1',
                        style: cairoW400(color: Colors.white, size: 12),
                      ),
                      child: Icon(Icons.message, size: 30, color: Colors.blue.shade900),
                    ),
                    SizedBox(width: defaultPadding),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        'assets/images/place_holder_4.jpg',
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      // padding: EdgeInsetsDirectional.only(top: 8),
      decoration: decorationRadius(color: Colors.white, radius: 24),
      child: TextField(
        decoration: InputDecoration(
          hintText: Responsive.isMobile(context) ? '' : 'search'.tr,
          hintStyle: cairoW500(color: Colors.black),
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.only(top: 6),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: const BorderRadius.all(Radius.circular(24)),
          ),
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
