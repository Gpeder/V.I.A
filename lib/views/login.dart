import 'package:flutter/material.dart';
import 'package:via/controller/login_controller.dart';
import 'package:via/theme/color.dart';
import 'package:via/theme/images.dart';
import 'package:via/widgets/main_textfield.dart';
import 'package:via/widgets/via_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late final LoginController controller;

  @override
  void initState() {
    super.initState();
    controller = LoginController()..addListener(_onControllerChanged);
  }

  void _onControllerChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    controller.removeListener(_onControllerChanged);
    controller.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    final String? errorMessage = await controller.login();
    if (!mounted) {
      return;
    }

    if (errorMessage != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(errorMessage)));
      return;
    }

    Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: controller.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              const Image(image: AssetImage(AppImages.logoIcon), height: 100),
              const SizedBox(height: 20),
              Text(
                'Bem-vindo de volta!',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              Text(
                'Entre na sua conta para continuar',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: AppColors.gray200),
              ),
              const SizedBox(height: 40),
              MainTextField(
                textInputAction: TextInputAction.next,
                labelText: 'E-mail',
                hintText: 'Seu e-mail',
                keyboardType: TextInputType.emailAddress,
                controller: controller.emailController,
                validator: controller.validateEmail,
              ),
              const SizedBox(height: 20),
              MainTextField(
                textInputAction: TextInputAction.done,
                labelText: 'Senha',
                hintText: 'Sua senha',
                obscureText: controller.isObscurePassword,
                controller: controller.passwordController,
                validator: controller.validatePassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.isObscurePassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: controller.togglePasswordVisibility,
                ),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Esqueci minha senha',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.primaryDark,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              MainButton(
                label: 'Entrar',
                isLoading: controller.isLoading,
                onPressed: _handleLogin,
                width: double.infinity,
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cadastro');
                },
                child: Text(
                  'Nao tem uma conta? Cadastre-se',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: AppColors.gray200),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
