import 'package:equatable/equatable.dart';

class VerifyOtpParameters extends Equatable {
  final String userId;
  final String otpCode;

  const VerifyOtpParameters({required this.otpCode, required this.userId});

  Map<String , dynamic > toJson() =>  {
    "user_id" : userId,
    "otp_code" : otpCode , 

  };

  @override
  List<Object?> get props => [otpCode,userId];
  
}