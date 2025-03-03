import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import 'package:movie_db/routing/routes.dart';
import 'package:movie_db/ui/core/widgets/button_custom.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 26),
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
              Lottie.asset('assets/lottie/splash.json'),
              Text('O lugar ideal para buscar, salvar e organizar seus filmes',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
              ButtonCustom(
                onTap: () async {
                  context.pushReplacement(Routes.login);
                },
                text: 'Quero começar!',
                icon: Icons.arrow_forward_ios_sharp,
              )
            ],
          )),
    );
  }
}
