
import '../../../../core/Api/endpoints.dart';

//has the response
class SigninModel {
  final String message;
  final String token;
  final String name;
  final int statusCode;
  final bool status;

  SigninModel(
      {required this.message,
      required this.token,
      required this.name,
      required this.statusCode,
      required this.status});
  factory SigninModel.fromJson(Map<String, dynamic> jsonData) {
    return SigninModel(
      message: jsonData[ApiKey.message]?.toString() ?? "Unknown error",
      token: jsonData[ApiKey.token],
      name: jsonData[ApiKey.name],
      statusCode: jsonData[ApiKey.statusCode],
      status: jsonData[ApiKey.status],
    );
  }
}
