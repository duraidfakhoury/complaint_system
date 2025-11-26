import 'package:equatable/equatable.dart';

class RegisterParameters extends Equatable {
  final String name ; 
  final String phoneNumber;
  final String email;
  final String password ;

  const RegisterParameters({required this.email , required this.password, required this.name, required this.phoneNumber});

  Map<String , dynamic > toJson() =>  {
    "email" : email , 
    "name" : name , 
    "phoneNumber" : phoneNumber , 
    "password" : password
  };

  @override
  List<Object?> get props => [email , password , name , phoneNumber];
  
}