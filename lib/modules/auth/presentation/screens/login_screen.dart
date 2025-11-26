
import 'package:complaint/core/core_components/app_button.dart';
import 'package:complaint/core/core_components/app_text_form_field.dart';
import 'package:complaint/core/core_components/show_snack_bar.dart';
import 'package:complaint/core/extensions/theme_text_style.dart';
import 'package:complaint/core/services/screen_size_service.dart';
import 'package:complaint/core/utils/app_logger.dart';
import 'package:complaint/core/utils/app_validator.dart';
import 'package:complaint/core/utils/base_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../home/presentation/routes/home_route.dart';


class LoginScreen extends StatefulWidget {
  /// This screen is fully Responsive
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final phoneFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    passwordController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginBloc>(),
      child: BlocConsumer<LoginBloc, BaseState<LoginResponse>>(
        listener: _loginListener,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(LocaleKeys.login.tr(context: context).toUpperCase()),
              centerTitle: true,
            ),
            body: AbsorbPointer(
              absorbing: state.isLoading,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  padding: ScreenSizeService.onScreenWidth(
                    context,
                    onDesktop: () => EdgeInsets.symmetric(horizontal: 35.w),
                    onMobile: () => EdgeInsets.symmetric(horizontal: 7.w),
                    onTablet: () => EdgeInsets.symmetric(horizontal: 20.w),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Header
                      if (ScreenSizeService.isDesktop(context))
                        const SizedBox(height: 220)
                      else
                        const SizedBox(height: 180),

                      // Phone number
                      AppTextFormField(
                        label: LocaleKeys.email.tr(context: context),
                        formKey: phoneFormKey,
                        controller: phoneNumberController,
                        hint: LocaleKeys.enterYourEmail
                            .tr(context: context),
                        validator: AppValidator().phoneValidator,
                        keyboardType: TextInputType.phone,
                        onlyNumbers: true,
                      ),

                      // Password
                      const SizedBox(height: 10),
                      AppTextFormField(
                        label: LocaleKeys.password.tr(context: context),
                        formKey: passwordFormKey,
                        controller: passwordController,
                        hint: LocaleKeys.enterPassword.tr(context: context),
                        validator: AppValidator().passwordValidator,
                        keyboardType: TextInputType.visiblePassword,
                        isPass: true,
                      ),

                      // Forget password
                      Row(
                        children: [
                          const Spacer(),
                          TextButton(
                            onPressed: () =>
                                context.push(ForgetPasswordRoute.name),
                            child: Text(
                              LocaleKeys.forgetPassword.tr(context: context),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),

                      // Login button
                      AppButton(
                        label: LocaleKeys.login.tr(context: context),
                        onTap: () => _loginPressed(context, state),
                        isLoading: state.isLoading,
                      ),
                      const SizedBox(height: 10),

                      // Footer
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              LocaleKeys.doNotHaveAnAccount
                                  .tr(context: context),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          FittedBox(
                            child: TextButton(
                              onPressed: () => context.pushReplacement(
                                  RegisterRoute.name),
                              child: Text(
                                LocaleKeys.register.tr(context: context),
                                style: Theme.of(context)
                                    .redUnderLineHeadLineTextStyle
                                    .copyWith(fontSize: 13),
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }


  void _loginPressed(BuildContext context, BaseState<LoginResponse> state) {
    if (_checkInvalid(state)) return;
    context.read<LoginBloc>().add(
          LoginButtonTappedEvent(
            password: passwordController.text,
            phoneNumber: phoneNumberController.text,
          ),
        );
  }

  bool _checkInvalid(BaseState<LoginResponse> state) =>
      !AppValidator().checkValidateFormsKeys(
        forms: [phoneFormKey, passwordFormKey],
        successCases: [!state.isLoading],
      );

  void _loginListener(BuildContext context, BaseState<LoginResponse> state) {
    if (state.isError) {
      showSnackBar(context, failure: state.failure, checkFailureType: false);
      return;
    }
    AppLogger().logObject(state.data ?? 'null');

    if (state.isSuccess ) {
      context.go(HomeRoute.name);
      showSnackBar(context,
          successMessage: LocaleKeys.loginDone.tr(context: context));
      return;
    }
  }
}
