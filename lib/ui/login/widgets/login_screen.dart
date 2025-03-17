import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_db/data/api/repositories/auth_repository/auth_repository.dart';
import 'package:movie_db/data/api/repositories/auth_repository/auth_repository_impl.dart';
import 'package:movie_db/data/api/services/auth_service/auth_service.dart';
import 'package:movie_db/routing/routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authRepository = GetIt.I.get<AuthService>();
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
              onPressed: () async {
                // context.pushReplacement(Routes.home);
                await authRepository.authWithLogin('username', 'password');
              },
              child: Text('Login')),
        ],
      )),
    );
  }
}
