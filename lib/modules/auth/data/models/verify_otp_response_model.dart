import 'package:complaint/modules/auth/domain/entity/verify_otp_response.dart';


class VerifyOtpResponseModel extends VerifyOtpResponse {
  const  VerifyOtpResponseModel();

  factory VerifyOtpResponseModel.fromJson (Map<String,dynamic> json) {
    return VerifyOtpResponseModel();
  }

}