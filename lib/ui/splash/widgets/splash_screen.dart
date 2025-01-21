import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_db/routing/routes.dart';
import 'package:movie_db/ui/core/widgets/button_custom.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 0, 0, 0),
                Color(0xFF7100cd),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 24,
            children: [
              SvgPicture.asset('assets/images/logo.svg', height: 100),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: Lottie.asset('assets/lottie/splash.json'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                    'O lugar ideal para buscar, salvar e organizar seus filmes',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              ButtonCustom(
                onTap: () {
                  // GoRouter.of(context).pushReplacement('/home');
                  context.pushReplacement(Routes.home);
                },
                text: 'Get Started',
                icon: Icons.arrow_forward_ios_sharp,
              )
            ],
          )),
    );
  }
}
