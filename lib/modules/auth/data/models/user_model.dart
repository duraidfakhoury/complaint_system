import 'package:complaint/modules/auth/domain/entity/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.email,
    required super.phone,
    required super.name,
    required super.role,
  });

  factory UserModel.fromJson(Map<String , dynamic> json ){
    return UserModel(id: json['id'], email: json["email"], phone: json["phone"], name: json["name"], role: json["role"]);
  }
  Map<String , dynamic > toJson () => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "role": role
  };
}