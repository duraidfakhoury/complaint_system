import 'dart:io';

import 'package:complaint/core/config/app_config.dart';
import 'package:complaint/core/constants/api_urls.dart';
import 'package:complaint/core/network/app_errors_handler.dart';
import 'package:complaint/core/network/network_helper.dart';
import 'package:complaint/core/routes/app_routes.dart';
import 'package:complaint/core/services/cache_service.dart';
import 'package:complaint/core/services/service_locator.dart';
import 'package:complaint/core/themes/app_theme.dart';
import 'package:complaint/core/themes/bloc/theme_bloc.dart';
import 'package:complaint/core/translations/app_locale.dart';
import 'package:complaint/core/utils/app_headers.dart';
import 'package:complaint/generated/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


Future<void> initVariables() async {
  ServicesLocator().init();
  await AppConfig().initVariables();
  ApisUrls().initBaseUrl(AppConfig().baseUrl);
  await CacheService.init();
  await CacheService().initCacheLanguage();
  await CacheService().initCacheTheme();
  NetworkHelper().init(headers: AppHeaders(), handler: AppErrorsHandler());
  await EasyLocalization.ensureInitialized();
}

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await initVariables();

  // set up easy_localization lib
  runApp(
    EasyLocalization(
      supportedLocales: AppLocale().supportedLocales,
      fallbackLocale: AppLocale().english,
      path: 'resources/langs',
      assetLoader: const CodegenLoader(),
      child: const MyApp(),
    ),
  );

  FlutterNativeSplash.remove();
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

    @override
  Widget build(BuildContext context) {

    // return Sizer Builder (Responsive UI)
    return BlocProvider(
      create: (context) => sl<ThemeBloc>(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return ResponsiveSizer(
            maxTabletWidth: 1024,
            maxMobileWidth: 600,
            builder: (context, orientation, deviceType) {
              return MaterialApp.router(
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                title: 'Easy Pay',
                theme: AppTheme().lightTheme(context),
                themeMode: state is DarkThemeActionState
                    ? ThemeMode.dark
                    : ThemeMode.light,
                darkTheme: AppTheme().darkTheme(context),
                routerConfig: AppRoutes.router,
                debugShowCheckedModeBanner: false,
              );
            },
          );
        },
      ),
    );
  }
}

