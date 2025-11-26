import 'package:equatable/equatable.dart';

class LoginParameters extends Equatable {

  final String identifier;
  final String password ;

  const LoginParameters({required this.identifier , required this.password});

  Map<String , dynamic > toJson() =>  {
    "email" : identifier , 
    "password" : password
  };

  @override
  List<Object?> get props => [identifier , password];
  
}