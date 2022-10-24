import 'package:egystore/Controllers/dashboard_controller.dart';
import 'package:egystore/Helper/decoration_helper.dart';
import 'package:egystore/Helper/fonts_helper.dart';
import 'package:egystore/Screens/SharedComponents/net_image.dart';
import 'package:egystore/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  bool _hoverQuiz = false;
  int _currentHover = -1;

  @override
  void initState() {
    super.initState();
    _hoverQuiz = false;
    _currentHover = -1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(defaultPadding),
          decoration: decorationRadius(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "What's due",
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
              SizedBox(height: defaultPadding),
              Consumer<DashboardController>(
                builder: (context, dashboardController, child) => SizedBox(
                  width: double.infinity,
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: List.generate(
                      dashboardController.departmentList.length,
                      (index) => Container(
                        // height: 160,
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  child: NetImage(
                                    uri: '${dashboardController.departmentList[index].imagePath}',
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  '${dashboardController.departmentList[index].caption}',
                                  style: cairoW500(color: Colors.black),
                                ),
                              ],
                            ),
                            SizedBox(width: defaultPadding),
                            Row(
                              children: [
                                Text(
                                  'Courses',
                                  style: cairoW500(color: Colors.black, size: 14),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  '${dashboardController.departmentList[index].itemId}',
                                  style: cairoW500(color: Colors.black, size: 14),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Topic',
                                  style: cairoW500(color: Colors.black, size: 14),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  '${dashboardController.departmentList[index].itemId}',
                                  style: cairoW500(color: Colors.black, size: 14),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Due To',
                                  style: cairoW500(color: Colors.black, size: 14),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  '${dashboardController.departmentList[index].itemId}',
                                  style: cairoW500(color: Colors.black, size: 14),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {},
                              onHover: (value) => setState(() {
                                _hoverQuiz = !_hoverQuiz;
                                _currentHover = index;
                              }),
                              child: Container(
                                width: double.infinity,
                                height: 30,
                                margin: EdgeInsets.all(8),
                                decoration: decorationRadiusBorder(
                                  color: _hoverQuiz && _currentHover == index
                                      ? Colors.blue.shade100
                                      : Colors.white,
                                  borderColor: Colors.blue.shade900,
                                ),
                                child: Center(
                                  child: Text(
                                    'Start Quiz',
                                    style: cairoW500(color: Colors.black, size: 14),
                                  ),
                                ),
                              ),
                            ),
                            index < 8 ? Divider() : const SizedBox(),
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
      ],
    );
  }
}
