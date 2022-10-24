import 'package:egystore/Helper/dio_helper.dart';
import 'package:egystore/Helper/helper.dart';
import 'package:egystore/Screens/IntroScreens/LoginScreen/login_screen.dart';
import 'package:egystore/Screens/MainScreens/DashboardScreen/dashboard_screen.dart';
import 'package:egystore/Screens/SharedComponents/getsnack_bars.dart';
import 'package:egystore/models/user_data_model.dart';
import 'package:egystore/models/user_token_model.dart';
import 'package:flutter/material.dart';

enum AuthStage { Normal, ERROR, LOADING, DONE }

class AuthController with ChangeNotifier {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool loading = false;

  ///
  /// Login
  ///

  UserTokenModel _userModel = UserTokenModel();

  UserTokenModel get userModel => _userModel;

  UserDataModel _userDataModel = UserDataModel();

  UserDataModel get userDataModel => _userDataModel;

  Future<void> login({required BuildContext context}) async {
    if (phoneController.text.isEmpty) {
      showError(body: 'please enter your phone');
      return;
    }
    if (passwordController.text.isEmpty) {
      showError(body: 'please enter your password');
      return;
    }
    loading = true;
    notifyListeners();
    dynamic response = await DioHelper.post(url: 'account/loginclient', data: {
      "Password": passwordController.text,
      "Username": phoneController.text.trim(),
    });
    if (response == null || response == false) {
      loading = false;
      notifyListeners();
      return;
    } else {
      loading = false;
      notifyListeners();
      if (response['statusDescreption'].toString() == 'Success') {
        loadData(response);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => DashboardScreen()),
          (route) => false,
        );
      } else if (response['statusDescreption'].toString() == 'InvalidUserOrPassword') {
        showError(body: response['message'].toString());
        // showError(title: 'notify', body: response['message'].toString());
      } else {
        showError(body: response['message'].toString());
      }
    }
    loading = false;
    notifyListeners();
  }

  Future<void> loadData(response) async {
    _userModel = UserTokenModel.fromJson(response['data']);
    _userDataModel = UserDataModel.fromJson(response['data']['userData']);
    await Helper.saveUserToken(_userModel.token.toString());
    Helper.token = _userModel.token.toString();
    await Helper.saveUserLogged(true);
    Helper.isLoggedIn = true;
    await Helper.saveUsername(_userModel.username.toString());
    Helper.userName = _userModel.username.toString();
    await Helper.saveClientId(_userDataModel.clientId.toString());
    Helper.clientId = _userDataModel.clientId.toString();
    await Helper.saveClientName(_userDataModel.clientName.toString());
    Helper.clientName = _userDataModel.clientName.toString();
    await DioHelper.init();
    // await Get.find<UserController>().getData();
  }

  void logout({required BuildContext context}) async {
    Helper.token = '';
    await Helper.saveUserToken('');
    Helper.isLoggedIn = false;
    await Helper.saveUserLogged(false);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const LoginScreen(),
      ),
      (route) => false,
    );
    // Get.offAll(() => LoginScreen());
  }
}
