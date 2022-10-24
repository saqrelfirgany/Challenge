import 'package:egystore/Helper/dio_helper.dart';
import 'package:egystore/Helper/helper.dart';
import 'package:egystore/Screens/IntroScreens/LoginScreen/login_screen.dart';
import 'package:egystore/Screens/MainScreens/DashboardScreen/dashboard_screen.dart';
import 'package:egystore/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future getData() async {
    _animationState();
    await getUserData();
    Future.delayed(const Duration(milliseconds: 1200), () {
      navigateToNextScreen();
    });
  }

  void _animationState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceOut,
    );
  }

  Future getUserData() async {
    Helper.isLoggedIn = await Helper.getUserLogged() ?? false;
    Helper.token = await Helper.getUserToken() ?? '';
    Helper.userName = await Helper.getUsername() ?? '';
    Helper.userId = await Helper.getUserId() ?? '';
    Helper.clientId = await Helper.getClientId() ?? '';
    Helper.clientName = await Helper.getClientName() ?? '';
  }

  Future<void> navigateToNextScreen() async {
    if (Helper.isLoggedIn == true && Helper.token.isNotEmpty) {
      await DioHelper.init();
      // Get.find<UserController>().getData();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) =>  DashboardScreen(),
        ),
        (route) => false,
      );
      // Get.offAll(() => HomeScreen());
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) =>  LoginScreen(),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ScaleTransition(
        scale: _animation,
        child: Center(
          child: Image.asset(
            "assets/app_logo.png",
            width: 268.w,
            height: 268.h,
          ),
        ),
      ),
    );
  }
}
