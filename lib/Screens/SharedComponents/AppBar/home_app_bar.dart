import 'package:egystore/Helper/fonts_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key, required this.title}) : super(key: key);
  final String title;

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
    );
  }
}
