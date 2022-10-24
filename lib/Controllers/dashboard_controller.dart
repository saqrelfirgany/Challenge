import 'package:egystore/Helper/dio_helper.dart';
import 'package:egystore/models/department_model.dart';
import 'package:egystore/models/offer_item_model.dart';
import 'package:flutter/material.dart';

enum DashboardStage { Normal, ERROR, LOADING, DONE }

class DashboardController with ChangeNotifier {
  DashboardStage dashboardStage = DashboardStage.Normal;

  Future<void> getDashboardData() async {
    dashboardStage = DashboardStage.LOADING;
    await getOfferItems();
    await getDepartments();
    dashboardStage = DashboardStage.DONE;
    notifyListeners();
  }

  ///
  /// Dashboard Offers
  ///
  List<OfferItemModel> _offerItemsList = [];

  List<OfferItemModel> get offerItemsList => _offerItemsList;

  DashboardStage offerStage = DashboardStage.Normal;

  Future<void> getOfferItems() async {
    offerStage = DashboardStage.LOADING;
    dynamic response = await DioHelper.get(
      url: 'AppLandingScreen/GetOfferServiceList?itemId=8',
    );
    if (response == null || response == false) {
      offerStage = DashboardStage.ERROR;
      return;
    } else {
      List<dynamic> dynamicList = response['data'];
      _offerItemsList.clear();
      for (var element in dynamicList) {
        _offerItemsList.add(OfferItemModel.fromJson(element));
      }
    }
    offerStage = DashboardStage.DONE;

    notifyListeners();
  }

  ///
  /// Dashboard Department
  ///
  List<DepartmentModel> _departmentList = [];

  List<DepartmentModel> get departmentList => _departmentList;

  Future<void> getDepartments() async {
    dynamic response = await DioHelper.get(url: '/AppLandingScreen/GetDepartmentList');
    if (response == null || response == false) {
      return;
    } else {
      List<dynamic> dynamicList = response['data'];
      _departmentList.clear();
      for (var element in dynamicList) {
        _departmentList.add(DepartmentModel.fromJson(element));
      }
    }
    notifyListeners();
  }
}
