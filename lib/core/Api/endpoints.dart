class Endpoints {
  static String baseUrl = "https://marketi-app.onrender.com/api/v1";
  static String signInUrl = "$baseUrl/auth/signIn";
  static String signUpUrl = "$baseUrl/auth/signUp";
  static String sendPassEmail = "$baseUrl/auth/sendPassEmail";
  static String resetPassword = "$baseUrl/auth/resetPassword";
}

class ApiKey {
  static String email = "email";
  static String password = "password";
  static String name = "name";
  static String phone = "phone";
  static String confirmPassword = "confirmPassword";

  static String statusCode = "statusCode";
  static String message = "message";
  static String token = "token";
  static String statusBool = "status";
}
