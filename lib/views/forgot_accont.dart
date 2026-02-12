import 'package:flutter/material.dart';
import 'package:via/theme/color.dart';
import 'package:via/theme/images.dart';
import 'package:via/widgets/main_textfield.dart';
import 'package:via/widgets/via_button.dart';

class ForgotAccont extends StatefulWidget {
  const ForgotAccont({super.key});

  @override
  State<ForgotAccont> createState() => _ForgotAccontState();
}

class _ForgotAccontState extends State<ForgotAccont> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {}

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Image(image: AssetImage(AppImages.logoIcon), height: 100),
            const SizedBox(height: 20),
            Text(
              'Esqueceu sua senha?',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            Text(
              'Informe seu e-mail e enviaremos um link para redefinir sua senha.',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(color: AppColors.gray200),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            MainTextField(
              textInputAction: TextInputAction.done,
              labelText: 'E-mail',
              hintText: 'Seu e-mail',
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            MainButton(
              label: 'Enviar link',
              onPressed: () {},
              width: double.infinity,
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text(
                'Lembrou a senha? Faça login',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: AppColors.primaryDark),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
