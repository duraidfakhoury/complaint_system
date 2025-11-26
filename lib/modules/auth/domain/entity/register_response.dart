import 'package:equatable/equatable.dart';

class RegisterResponse extends Equatable {
  final String userId ;
  final String otpCode ; 

  const RegisterResponse  ({required this.otpCode , required this.userId});
  
  @override
  List<Object?> get props => [userId , otpCode];  
}