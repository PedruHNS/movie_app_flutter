import 'package:go_router/go_router.dart';
import 'package:movie_db/routing/routes.dart';
import 'package:movie_db/ui/home/widgets/home_screen.dart';
import 'package:movie_db/ui/splash/widgets/splash_screen.dart';

final router = GoRouter(routes: [
  GoRoute(path: Routes.splash, builder: (context, state) => const SplashScreen()),
  GoRoute(path: Routes.home, builder: (context, state) => HomeScreen())
]);
