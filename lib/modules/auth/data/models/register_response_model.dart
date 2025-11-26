import 'package:complaint/modules/auth/domain/entity/register_response.dart';

class RegisterResponseModel extends RegisterResponse {
  const RegisterResponseModel({
    required super.userId,
    required super.otpCode,
  });

  factory RegisterResponseModel.fromJson(Map<String,dynamic> json ) {
    return RegisterResponseModel(
      userId: json["user_id"], 
      otpCode: json["otp_code"] );
  }

  Map<String , dynamic > toJson() => {
    "user_id" : userId,
    "otp_code" : otpCode
  };
}