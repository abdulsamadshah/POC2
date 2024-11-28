import 'package:get/get.dart';
import 'package:getxbase/Modules/authentication/onborading/splashscreen.dart';
import 'package:getxbase/Modules/homescreen/homescreens.dart';
import 'package:getxbase/Routes/app_routes.dart';

const Transition transition = Transition.cupertino;

class AppPages {
  ///
  /// Define Initial Screen Route
  ///
  static const INITIAL = AppRoutes.splashScreen;

  ///
  /// Static list of routes with Page name, Route name & Transition
  ///
  static final routes = [
    GetPage(
        name: AppRoutes.splashScreen,
        page: () => const SplashScreen(),
        transition: transition),
    GetPage(
        name: AppRoutes.Homescreen,
        page: () => const Homescreen(),
        transition: transition),
  ];
}
