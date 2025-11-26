// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _ar_SY = {
  "welcome": "مرحبا ",
  "login": "تسجيل الدخول ",
  "emptyField": "الحقل فارغ قم بتعبئة المعلومات",
  "invalidPhoneNumber": "رقم الهاتف غير مطابق",
  "invalidNumber": "الرقم المدخل غير مطابق",
  "invalidLength": "الحد الادنى {} محارف",
  "invalidEmailAddress": "عنوان البريد الالكتروني غير مطابق",
  "missingUppercase": "يجب أن تحوي كلمة المرور على أحرف كبيرة",
  "missingLowercase": "يجب أن تحوي كلمة المرور على أحرف صغيرة",
  "missingSymbols": "يجب أن تحوي كلمة المرور على رموز",
  "chooseAnImage": "قم باختيار صورة",
  "invalidDateFormat": "تنسيق التاريخ غير مطابق (dd-MM-yyyy)",
  "youMustEnterANumberLessThan": "يجب ادخال رقم أصغر من {}",
  "youMustEnterANumberMoreThan": "يجب ادخال رقم أكبر من {}",
  "passwordsDoNotMatch": "كملة المرور غير مطابقة",
  "invalidPinCode": "الرمز السري للدفع يجب أن يتكون من {} محارف",
  "invalidOtpCode": "رمز التحقق otp يجب أن يتكون من {} محارف",
  "loginDone": "تم تسجيل الدخول بنجاح",
  "phoneNumber": "رقم الهاتف",
  "enterYourPhoneNumber": "أدخل رقم هاتفك",
  "email": "البريد الالكتروني",
  "enterYourEmail": "أدخل بريدك الالكتروني",
  "password": "كلمة المرور",
  "enterPassword": "أدخل كلمة المرور",
  "doNotHaveAnAccount": "ليس لديك حساب ؟",
  "forgetPassword": "نسيان كلمة المرور",
  "register": "انشاء حساب"
};
static const Map<String,dynamic> _en_US = {
  "welcome": "Welcome",
  "login": "login",
  "emptyField": "Empty field, try to add data",
  "invalidPhoneNumber": "Invalid Phone Number",
  "invalidNumber": "Invalid number format",
  "invalidLength": "Invalid Length, Minimum {} characters",
  "invalidEmailAddress": "Invalid email address",
  "missingUppercase": "Password must contain uppercase letters",
  "missingLowercase": "Password must contain lowercase letters",
  "missingSymbols": "Password must contain symbols",
  "chooseAnImage": "Choose an image",
  "invalidDateFormat": "Invalid date format (dd-MM-yyyy)",
  "youMustEnterANumberLessThan": "You must enter a number less than {}",
  "youMustEnterANumberMoreThan": "You must enter a number more than {}",
  "passwordsDoNotMatch": "Passwords do not match",
  "invalidPinCode": "Smart payment PIN must consist of {} Characters",
  "invalidOtpCode": "Otp code must consist of {} Characters",
  "loginDone": "Login Successfully",
  "phoneNumber": "Phone Number",
  "enterYourPhoneNumber": "Enter Your Phone Number",
  "email": "email",
  "enterYourEmail": "Enter Your Email",
  "password": "Password",
  "enterPassword": "Enter Your Password",
  "doNotHaveAnAccount": "Don't Have An Account?",
  "register": "Create Account",
  "forgetPassword": "Forget Password"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar_SY": _ar_SY, "en_US": _en_US};
}
