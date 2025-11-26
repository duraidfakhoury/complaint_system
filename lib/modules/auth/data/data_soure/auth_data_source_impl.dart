import 'package:complaint/core/constants/api_urls.dart';
import 'package:complaint/core/network/network_helper.dart';
import 'package:complaint/core/services/cache_service.dart';
import 'package:complaint/modules/auth/data/data_soure/auth_data_source.dart';
import 'package:complaint/modules/auth/data/models/login_response_model.dart';
import 'package:complaint/modules/auth/data/models/register_response_model.dart';
import 'package:complaint/modules/auth/data/models/verify_otp_response_model.dart';
import 'package:complaint/modules/auth/domain/parameters/login_parameters.dart';
import 'package:complaint/modules/auth/domain/parameters/register_parameters.dart';
import 'package:complaint/modules/auth/domain/parameters/verify_otp_parameters.dart';

class AuthDataSourceImpl extends AuthDataSource {
  @override
  Future<LoginResponseModel> login(LoginParameters parameters) async {
    NetworkResponse response = await NetworkHelper().post(
      ApisUrls().login,
      headers: {'content-type' : 'application/json '},
      data: parameters.toJson()
      );
    await CacheService().setToken(response.data['access_token']);
    return LoginResponseModel.fromJson(response.data);
  }

  @override
  Future<RegisterResponseModel> register(RegisterParameters parameters) async {
    NetworkResponse response = await NetworkHelper().post(
      ApisUrls().register,
      headers: {'content-type' : 'application/json '},
      data: parameters.toJson()
      );
    await CacheService().setToken(response.data['access_token']);
    return RegisterResponseModel.fromJson(response.data);
  }

  @override
  Future<VerifyOtpResponseModel> verifyOtp(VerifyOtpParameters parameters) async {
    NetworkResponse response = await NetworkHelper().post(
      ApisUrls().register,
      headers: {'content-type' : 'application/json '},
      data: parameters.toJson()
      );
    await CacheService().setToken(response.data['access_token']);
    return VerifyOtpResponseModel.fromJson(response.data);
  }
}