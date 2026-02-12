import 'package:flutter/material.dart';
import 'package:via/theme/color.dart';
import 'package:via/theme/images.dart';
import 'package:via/widgets/main_textfield.dart';
import 'package:via/widgets/via_button.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
        padding: .symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: .center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Image(image: AssetImage(AppImages.logoIcon), height: 100),
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
            ),
            const SizedBox(height: 20),
            MainTextField(
              textInputAction: TextInputAction.done,
              labelText: 'Senha',
              hintText: 'Sua senha',
              obscureText: true,
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Esqueci minha senha",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.primaryDark,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
            MainButton(
              label: 'Entrar',
              onPressed: () {},
              width: double.infinity,
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cadastro');
              },
              child: Text(
                "Não tem uma conta? Cadastre-se",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: AppColors.gray200),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
