import 'package:egystore/Controllers/dashboard_controller.dart';
import 'package:egystore/Helper/decoration_helper.dart';
import 'package:egystore/Helper/fonts_helper.dart';
import 'package:egystore/Screens/MainScreens/DashboardScreen/Body/quiz.dart';
import 'package:egystore/Screens/SharedComponents/net_image.dart';
import 'package:egystore/theme/theme.dart';
import 'package:egystore/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExamDetails extends StatelessWidget {
  const ExamDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Container(
            padding: EdgeInsets.all(defaultPadding),
            decoration: decorationRadius(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Announcements',
                      style: cairoW600(color: Colors.black, size: 20),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'All',
                        style: cairoW600(color: Colors.blue.shade900, size: 20),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Sub Title',
                  style: cairoW500(color: Colors.black),
                ),
                Consumer<DashboardController>(
                  builder: (context, dashboardController, child) => SizedBox(
                    width: double.infinity,
                    child: ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: List.generate(
                        dashboardController.offerItemsList.length,
                        (index) => Container(
                          height: 80,
                          margin: EdgeInsets.all(8),
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                child: NetImage(uri: ''),
                              ),
                              SizedBox(width: defaultPadding),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${dashboardController.offerItemsList[index].serviceName}',
                                      style: cairoW700(color: Colors.black),
                                      maxLines: 1,
                                    ),
                                    Text(
                                      '${dashboardController.offerItemsList[index].serviceDes}',
                                      style: cairoW500(color: Colors.black, size: 14),
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: defaultPadding),
                              Expanded(
                                flex: 4,
                                child: Text(
                                  '${dashboardController.offerItemsList[index].serviceName} '
                                  '${dashboardController.offerItemsList[index].serviceDes} '
                                  '${dashboardController.offerItemsList[index].serviceName} '
                                  '${dashboardController.offerItemsList[index].serviceDes} ',
                                  style: cairoW500(color: Colors.black, size: 14),
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (!Responsive.isMobile(context)) SizedBox(width: defaultPadding),
        if (!Responsive.isMobile(context))
          Expanded(
            flex: 1,
            child: Quiz(),
          ),
      ],
    );
  }
}
