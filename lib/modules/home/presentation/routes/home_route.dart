import 'package:complaint/core/services/cache_service.dart';
import 'package:complaint/core/utils/app_logger.dart';
import 'package:complaint/modules/auth/presentation/routes/login_route.dart';
import 'package:go_router/go_router.dart';


class HomeRoute {
  static const String name = '/home';
  static GoRoute route = GoRoute(
    path: name,
    redirect: (context, state) {
      AppLogger().logObject(
          "${CacheService().hasToken}  ");
      if (!CacheService().hasToken) return LoginRoute.name;
      return null;
    },
    builder: (context, state) {
      return const MainScreen();
    },
  );
}
