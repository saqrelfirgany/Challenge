import 'package:egystore/Screens/IntroScreens/SplashScreen/splash_screen.dart';
import 'package:egystore/theme/theme.dart';
import 'package:egystore/utils/langs/translation.dart';
import 'package:egystore/utils/local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import 'Controllers/MenuController.dart';
import 'Controllers/auth_controller.dart';
import 'Controllers/dashboard_controller.dart';
import 'Controllers/lang_controller.dart';
import 'Helper/dio_helper.dart';
import 'dependencies/dependencies.dart' as dep;

const domain = "http://xero.market-alsmah.com/api";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  await GetStorage.init();
  // await NetworkHelper.init();
  await DioHelper.init();
  // initializeDateFormatting();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MenuController>(
          create: (_) => MenuController(),
        ),
        ChangeNotifierProvider<AuthController>(
          create: (_) => AuthController(),
        ),
        ChangeNotifierProvider<DashboardController>(
          create: (_) => DashboardController(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, widget) => GetBuilder<LangController>(
          builder: (controller) => GetMaterialApp(
            builder: (context, widget) {
              //add this line
              // ScreenUtil.setContext(context);
              return MediaQuery(
                //Setting font does not change with system font size
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget!,
              );
            },
            debugShowCheckedModeBanner: false,
            title: 'Challenge',
            theme: Themes.light,
            darkTheme: Themes.dark,
            themeMode: LocalStorage().theme,
            translations: Translation(),
            locale: Locale(controller.selectedLang),
            fallbackLocale: Locale(controller.selectedLang),
            home: SplashScreen(),
          ),
        ),
      ),
    );
  }
}
