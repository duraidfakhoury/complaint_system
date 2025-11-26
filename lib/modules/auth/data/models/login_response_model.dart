import 'package:complaint/modules/auth/domain/entity/login_response.dart';
import 'user_model.dart';

class LoginResponseModel extends LoginResponse {
  const LoginResponseModel({
    required super.accessToken,
    required UserModel super.user,
  });

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      accessToken: json['access_token'], 
      user: UserModel.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "user": (user as UserModel).toJson(),
      };
}