import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../injection/injection.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthBloc>(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Login Production Ready')),
        body: const LoginView(),
      ),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          authenticated: (user) => ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Bienvenido ${user.email}'))),
          error: (msg) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(msg), backgroundColor: Colors.red),
          ),
          orElse: () {},
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          orElse: () => Center(
            child: ElevatedButton(
              onPressed: () {
                context.read<AuthBloc>().add(
                  const AuthEvent.loginRequested(
                    email: "test@test.com",
                    password: "123456",
                  ),
                );
              },
              child: const Text('Simular Login'),
            ),
          ),
        );
      },
    );
  }
}
