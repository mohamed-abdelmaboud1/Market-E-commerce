import '../../../../core/Api/endpoints.dart';

class UserDataModel {
  final String id;
  final String name;
  final String email;
  final String gender;
  final String address;
  final String type;
  //final String image;

  UserDataModel({
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.address,
    required this.type,
   // required this.image,
  });
  factory UserDataModel.fromJson(Map<String, dynamic> jsonData) {
    return UserDataModel(
      name: jsonData[ApiKey.name],
      id: jsonData[ApiKey.getId] ?? '',
      email: jsonData[ApiKey.email] ?? '',
      gender: jsonData[ApiKey.gender] ?? '',
      address: jsonData[ApiKey.address] ?? '',
      type: jsonData[ApiKey.type] ?? '',
      //image: jsonData[ApiKey.image] ?? '',
    );
  }
  //using when edit
    Map<String, dynamic> toJson() {
    return {
      ApiKey.getId: id,
      ApiKey.name: name,
      ApiKey.email: email,
      ApiKey.gender: gender,
      ApiKey.address: address,
      ApiKey.type: type,
      //ApiKey.image: image,
    };
  }
}

class UserDataResponse {
  final UserDataModel message;

  UserDataResponse({required this.message});

  factory UserDataResponse.fromJson(Map<String, dynamic> json) {
    return UserDataResponse(
      message: UserDataModel.fromJson(json['message']),
    );
  }
    Map<String, dynamic> toJson() {
    return {
      'message': message.toJson(),
    };
  }
}
