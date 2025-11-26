import 'package:complaint/modules/auth/data/models/login_response_model.dart';
import 'package:complaint/modules/auth/data/models/register_response_model.dart';
import 'package:complaint/modules/auth/data/models/verify_otp_response_model.dart';
import 'package:complaint/modules/auth/domain/parameters/login_parameters.dart';
import 'package:complaint/modules/auth/domain/parameters/register_parameters.dart';
import 'package:complaint/modules/auth/domain/parameters/verify_otp_parameters.dart';

abstract class AuthDataSource {
  Future<LoginResponseModel> login(LoginParameters parameters);
  Future<RegisterResponseModel> register(RegisterParameters parameters);
  Future<VerifyOtpResponseModel> verifyOtp(VerifyOtpParameters parameters);
}