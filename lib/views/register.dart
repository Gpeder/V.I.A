import 'package:flutter/material.dart';
import 'package:via/theme/color.dart';
import 'package:via/theme/images.dart';
import 'package:via/widgets/main_textfield.dart';
import 'package:via/widgets/via_button.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool isObscureText = true;
  bool isObscureTextConfirm = true;
  bool isLoading = false;

  //* Validação de senha
  bool _hasUppercase(String value) => RegExp(r'[A-Z]').hasMatch(value);
  bool _hasNumber(String value) => RegExp(r'\d').hasMatch(value);
  bool _hasSpecialChar(String value) =>
      RegExp(r'[!@#$%^&*(),.?":{}|<>_\-\\[\]/+=~`]').hasMatch(value);

  String _passwordValidationMessage(String value) {
    final List<String> missing = [];

    if (!_hasUppercase(value)) {
      missing.add('1 letra maiuscula');
    }
    if (!_hasNumber(value)) {
      missing.add('1 numero');
    }
    if (!_hasSpecialChar(value)) {
      missing.add('1 caractere especial');
    }

    return 'Senha precisa conter ${missing.join(', ')}.';
  }

  //* Validação de email 
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'E-mail inválido';
    }
    return null;
  }

  void toggleObscureText() {
    setState(() {
      isObscureText = !isObscureText;
    });
  }

  void toggleObscureTextConfirm() {
    setState(() {
      isObscureTextConfirm = !isObscureTextConfirm;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> register() async {
    final String password = passwordController.text;

    if (!_hasUppercase(password) || !_hasNumber(password) || !_hasSpecialChar(password)) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(_passwordValidationMessage(password))));
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('As senhas nao coincidem')),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) {
      return;
    }

    setState(() {
      isLoading = false;
    });

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(image: AssetImage(AppImages.logoIcon), height: 120),
            const SizedBox(height: 20),
            Text('Crie sua conta', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 10),
            Text(
              'Junte-se a comunidade de voluntarios',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.gray200),
            ),
            const SizedBox(height: 30),

            MainTextField(
              labelText: 'Nome completo',
              hintText: 'Seu nome',
              controller: nameController,
            ),
            const SizedBox(height: 10),

            MainTextField(
              labelText: 'E-mail',
              hintText: 'Seu e-mail',
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              validator: _validateEmail,
            ),
            const SizedBox(height: 10),

            MainTextField(
              labelText: 'Senha',
              hintText: 'Sua senha',
              obscureText: isObscureText,
              controller: passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo obrigatório';
                }
                if (!_hasUppercase(value) || !_hasNumber(value) || !_hasSpecialChar(value)) {
                  return _passwordValidationMessage(value);
                }
                return null;
              },
              suffixIcon: IconButton(
                icon: Icon(isObscureText ? Icons.visibility : Icons.visibility_off),
                onPressed: toggleObscureText,
              ),
            ),
            const SizedBox(height: 10),

            MainTextField(
              labelText: 'Confirmar senha',
              hintText: 'Confirme sua senha',
              controller: confirmPasswordController,
              suffixIcon: IconButton(
                icon: Icon(
                  isObscureTextConfirm ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: toggleObscureTextConfirm,
              ),
              obscureText: isObscureTextConfirm,
            ),
            const SizedBox(height: 30),
            MainButton(
              label: 'Criar conta',
              isLoading: isLoading,
              onPressed: register,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
