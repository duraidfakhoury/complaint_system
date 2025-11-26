import 'package:complaint/core/network/app_errors_handler.dart';
import 'package:complaint/core/network/exeptions/failure.dart';
import 'package:complaint/modules/auth/data/data_soure/auth_data_source.dart';
import 'package:complaint/modules/auth/domain/entity/login_response.dart';
import 'package:complaint/modules/auth/domain/entity/verify_otp_response.dart';
import 'package:complaint/modules/auth/domain/entity/register_response.dart';
import 'package:complaint/modules/auth/domain/parameters/login_parameters.dart';
import 'package:complaint/modules/auth/domain/parameters/register_parameters.dart';
import 'package:complaint/modules/auth/domain/parameters/verify_otp_parameters.dart';
import 'package:complaint/modules/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl extends AuthRepository {

  final AuthDataSource authDataSource;
  
  AuthRepositoryImpl(this.authDataSource);

  @override
  Future<Either<Failure, LoginResponse>> login(LoginParameters parameters) {
    return AppErrorsHandler()
        .defaultHandleEither(() => authDataSource.login(parameters));
  }

  @override
  Future<Either<Failure, RegisterResponse>> register(RegisterParameters parameters) {
    return AppErrorsHandler()
        .defaultHandleEither(() => authDataSource.register(parameters));
  }

  @override
  Future<Either<Failure, VerifyOtpResponse>> verifyOtp(VerifyOtpParameters parameters) {
    return AppErrorsHandler()
        .defaultHandleEither(() => authDataSource.verifyOtp(parameters));
  }
}