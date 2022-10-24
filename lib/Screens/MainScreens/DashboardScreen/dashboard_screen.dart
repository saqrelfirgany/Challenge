import 'package:badges/badges.dart';
import 'package:egystore/Controllers/MenuController.dart';
import 'package:egystore/Controllers/dashboard_controller.dart';
import 'package:egystore/Helper/decoration_helper.dart';
import 'package:egystore/Helper/fonts_helper.dart';
import 'package:egystore/Screens/SharedComponents/net_image.dart';
import 'package:egystore/theme/theme.dart';
import 'package:egystore/utils/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

import 'Body/exam_details.dart';
import 'Body/header.dart';
import 'Body/quiz.dart';
import 'Body/side_menu.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final ScrollController _controller = ScrollController();
  late DashboardController _dashboardController;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
    _dashboardController = Provider.of<DashboardController>(context, listen: false);
    await _dashboardController.getDashboardData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(),
      body: Row(
        children: [
          ///
          /// Side Menu
          ///
          if (Responsive.isDesktop(context))
            Expanded(
              child: SideMenu(),
            ),

          ///
          /// Screen
          ///
          Consumer<DashboardController>(
            builder: (context, dashboardController, child) => dashboardController.dashboardStage ==
                    DashboardStage.LOADING
                ? Expanded(flex: 5, child: Loader())
                : Expanded(
                    flex: 5,
                    child: SingleChildScrollView(
                      controller: _controller,
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.all(defaultPadding),
                      child: Column(
                        children: [
                          SizedBox(height: 20.h),
                          ///
                          /// Header
                          ///
                          Header(),
                          Responsive.isMobile(context)
                              ? Row(
                                  children: [
                                    Badge(
                                      badgeContent: Text(
                                        '3',
                                        style: cairoW400(color: Colors.white, size: 12),
                                      ),
                                      child: Icon(Icons.add_alert_rounded,
                                          size: 30, color: Colors.blue.shade900),
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
                                )
                              : const SizedBox(),
                          SizedBox(height: defaultPadding),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 5,
                                child: Column(
                                  children: [
                                    ///
                                    /// Exams Time
                                    ///
                                    Container(
                                      height: 220.h,
                                      padding: EdgeInsets.all(defaultPadding),
                                      decoration: decorationRadius(color: Colors.white),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: Responsive.isMobile(context) ? 3 : 2,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'examsTime'.tr,
                                                  style: cairoW700(color: Colors.blue.shade800, size: 32),
                                                ),
                                                Text(
                                                  'uploadYourCode'.tr,
                                                  style: cairoW700(color: Colors.grey),
                                                  maxLines: 2,
                                                ),
                                                SizedBox(height: defaultPadding),
                                                Container(
                                                  width: 120,
                                                  height: 30,
                                                  decoration: decorationRadius(color: Colors.blue.shade800),
                                                  padding: EdgeInsets.all(4),
                                                  child: FittedBox(
                                                    child: Text(
                                                      'viewExamsTips'.tr,
                                                      style: cairoW400(color: Colors.white),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          // Spacer(),
                                          Expanded(child: Image.asset('assets/images/place_holder_1.jpg')),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: defaultPadding),

                                    ///
                                    /// Sections 2 in the screen
                                    ///
                                    ExamDetails(),
                                    if (Responsive.isMobile(context)) SizedBox(height: defaultPadding),
                                    if (Responsive.isMobile(context))
                                      // Sorry for wrong spelling
                                      Quiz(),
                                  ],
                                ),
                              ),
                              SizedBox(width: defaultPadding),
                              // if (!Responsive.isMobile(context))
                              //   Expanded(
                              //     flex: 2,
                              //     child: StarageDetails(),
                              //   ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
