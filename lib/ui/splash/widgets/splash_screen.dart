import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_db/routing/routes.dart';
import 'package:movie_db/ui/splash/view_model/splash_vm.dart';
import 'package:signals/signals_flutter.dart';

class SplashScreen extends StatefulWidget {
  final SplashVm _controler;
  const SplashScreen({super.key, required controler}) : _controler = controler;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await widget._controler.init();
      if (mounted) {
        if (widget._controler.isFirstLogin) {
          context.pushReplacement(Routes.getStarted);
        } else {
          context.pushReplacement(Routes.login);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(child: Watch(
        (context) {
          return Center(
            child: widget._controler.getIsLoading
                ? CircularProgressIndicator()
                : SizedBox(),
          );
        },
      )),
    );
  }
}
