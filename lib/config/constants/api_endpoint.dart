class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  static const String baseUrl = "http://192.168.137.1:3000/";
  // static const String baseUrl = "http://10.0.0.1:3000/api/"; //for emulator
  static const String imageUrl = "http://192.168.137.1:3000/listings";

  // ====================== Auth Routes ======================7
  static const String login = "users/login";
  static const String register = "users/register";
  static const String listing="listings";
   static const String allListing="listings/all";
}
