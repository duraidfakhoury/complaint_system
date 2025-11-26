import 'package:complaint/core/network/exeptions/failure.dart';
import 'package:complaint/modules/auth/domain/entity/login_response.dart';
import 'package:complaint/modules/auth/domain/entity/verify_otp_response.dart';
import 'package:complaint/modules/auth/domain/entity/register_response.dart';
import 'package:complaint/modules/auth/domain/parameters/login_parameters.dart';
import 'package:complaint/modules/auth/domain/parameters/register_parameters.dart';
import 'package:complaint/modules/auth/domain/parameters/verify_otp_parameters.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure,LoginResponse>> login(LoginParameters parameters);
  Future<Either<Failure,RegisterResponse>> register(RegisterParameters parameters);
  Future<Either<Failure,VerifyOtpResponse>> verifyOtp(VerifyOtpParameters parameters);
}