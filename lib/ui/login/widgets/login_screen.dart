import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_db/routing/routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SizedBox(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Senha'),
          ),
          ElevatedButton(
              onPressed: () {
                context.pushReplacement(Routes.home);
              },
              child: Text('Login')),
        ],
      )),
    );
  }
}
