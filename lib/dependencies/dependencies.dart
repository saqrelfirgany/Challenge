import 'package:egystore/Controllers/lang_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<void> init() async {
  ///
  /// SharedPreferences
  ///
  // final sharedPreferences = await SharedPreferences.getInstance();
  // Get.lazyPut(() => sharedPreferences, fenix: true);

  ///
  /// API Client
  ///
  // Get.lazyPut(
  //   () => ApiClient(
  //     appBaseUrl: AppConstants.baseUrl,
  //     sharedPreferences: Get.find(),
  //   ),
  // );


  ///
  /// Controller
  ///

  Get.lazyPut(() => LangController(), fenix: true);
  // Get.lazyPut(() => NavigationController(), fenix: true);
  // Get.lazyPut(() => TraderController(), fenix: true);
}
