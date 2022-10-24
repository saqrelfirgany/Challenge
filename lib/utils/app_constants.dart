class AppConstants {
  static const String appName = "Cashier";
  static const int appVersion = 1;

  static const String baseUrl = "http://xero.market-alsmah.com/api";

  static const String uploadUri = "$baseUrl/uploads/";


  static const String loginUri = "/LoginScreen";
  static const String terminationsUri = "/terminations/store";
  static const String storeDataUri = "/terminations/store-data";
  static const String helpersUri = "/payment-types/children/1";
  static const String helpers2Uri = "/payment-types/children/2";
  static const String helpers3Uri = "/payment-types/children/3";
  static const String deleteTerminationUri = "/terminations/destroy/";
  static const String destroyTerminationUri = "/terminations/destroy-termination/";
  static const String saveTotalUri = "/terminations/more-data/";

  ///
  /// User info
  ///
  static const String userInfoUri = "/authentication/token/new";

  static const String token = "";
  static const String phone = "phone";
  static const String password = "password";

  static const String apiKey = "";
}
