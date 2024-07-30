import 'package:auto_route/auto_route.dart';
import 'package:weaver/features/pomo/pages/pomo_page.dart';
import 'package:weaver/features/settings/pages/settings_page.dart';
import 'package:weaver/features/splash/pages/splash_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: SettingsRoute.page),
      ];
}
