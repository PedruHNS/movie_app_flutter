import 'package:go_router/go_router.dart';
import 'package:movie_db/config/dependencies.dart';
import 'package:movie_db/routing/routes.dart';
import 'package:movie_db/ui/details/view_model/details_vm.dart';
import 'package:movie_db/ui/details/widget/details_screen.dart';
import 'package:movie_db/ui/get_started/widgets/get_started_screen.dart';
import 'package:movie_db/ui/home/view_model/home_vm.dart';
import 'package:movie_db/ui/home/widgets/home_screen.dart';
import 'package:movie_db/ui/login/widgets/login_screen.dart';
import 'package:movie_db/ui/splash/view_model/splash_vm.dart';
import 'package:movie_db/ui/splash/widgets/splash_screen.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: Routes.splash,
    builder: (context, state) => SplashScreen(controler: getIt<SplashVm>()),
  ),
  GoRoute(
      path: Routes.getStarted,
      builder: (context, state) => const GetStartedScreen()),
  GoRoute(
    path: Routes.login,
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: Routes.home,
    builder: (context, state) => HomeScreen(controller: getIt<HomeVm>()),
  ),
  GoRoute(
      path: Routes.details,
      builder: (context, state) {
        final id = state.extra as String;
        return DetailsScreen(id: id, controller: getIt<DetailsVm>());
      })
]);
