import 'dart:ui';

import 'package:egystore/Controllers/dashboard_controller.dart';
import 'package:egystore/models/department_model.dart';
import 'package:egystore/models/offer_item_model.dart';
import 'package:flutter_test/flutter_test.dart';

class MockDashboard implements DashboardController {
  @override
  late DashboardStage dashboardStage;

  @override
  late DashboardStage offerStage;

  @override
  void addListener(VoidCallback listener) {}

  @override
  List<DepartmentModel> get departmentList => [];

  @override
  void dispose() {}

  @override
  Future<void> getDashboardData() {
    throw UnimplementedError();
  }

  @override
  Future getDepartments() async {
    return await [];
  }

  @override
  Future getOfferItems() async {
    return await [];
  }

  @override
  bool get hasListeners => true;

  @override
  void notifyListeners() {}

  @override
  List<OfferItemModel> get offerItemsList => [];

  @override
  void removeListener(VoidCallback listener) {}
}

void main() {
  test('', () {});
}
