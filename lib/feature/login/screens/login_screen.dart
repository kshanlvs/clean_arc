  import 'package:clean_arc/feature/login/viewmodel/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.read<LoginViewModel>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Observer(
          builder: (_) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(controller: emailController, decoration: const InputDecoration(labelText: 'Email')),
              const SizedBox(height: 10),
              TextField(controller: passwordController, decoration: const InputDecoration(labelText: 'Password')),
              const SizedBox(height: 20),
              vm.isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () => vm.login(
                        emailController.text,
                        passwordController.text,
                      ),
                      child: const Text('Login'),
                    ),
              const SizedBox(height: 20),
              if (vm.error != null)
                Text(vm.error!, style: const TextStyle(color: Colors.red)),
              if (vm.user != null)
                Text('Welcome, ${vm.user!.email}', style: const TextStyle(color: Colors.green)),
            ],
          ),
        ),
      ),
    );
  }
}
