import 'package:complaint/core/network/base_headers.dart';
import 'package:complaint/core/services/cache_service.dart';

/// This class [AppHeaders] identifier represents the headers that can be sent to the server side
/// this class should have all headers in your application
/// [defaultHeaders] expresses the base headers used to interact with the server side
///
/// You can also define which headers could be used in the application

class AppHeaders extends BaseHeaders {
  static AppHeaders? _instance;
  AppHeaders._();
  factory AppHeaders() => _instance ??= AppHeaders._();

  @override
  Map<String, String> get defaultHeaders => {
        if (CacheService().hasToken)
          "Authorization": "Bearer ${CacheService().token}",
        "Accept": "application/json",
        "Content-Type": "application/json",
      };
}
