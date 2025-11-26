import 'dart:convert';

import 'package:complaint/core/utils/app_logger.dart';
import 'package:flutter/services.dart';


class AppConfig {
  static AppConfig? _instance;
  AppConfig._();
  factory AppConfig() => _instance ??= AppConfig._();

  late String baseUrl;
  Future<void> initVariables() async {
    try {
      final String contents = await rootBundle.loadString('assets/config.json');
      final Map<String, dynamic> data = json.decode(contents);
      final String baseUrl = data['baseUrl'];

      this.baseUrl = baseUrl;
      AppLogger().debugFLog(
          "Base URL: $baseUrl");
    } catch (e) {
      AppLogger().debugFLog("Error in base url init: $e");
      setDefaultValues();
    }
  }

  void setDefaultValues() {
    baseUrl = '';
  }
}
