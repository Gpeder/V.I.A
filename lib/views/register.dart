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
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isObscureText = true;
  bool isObscureTextConfirm = true;
  bool isLoading = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _hasMinLength(String value) => value.length >= 8;
  bool _hasUppercase(String value) => RegExp(r'[A-Z]').hasMatch(value);
  bool _hasNumber(String value) => RegExp(r'\d').hasMatch(value);
  bool _hasSpecialChar(String value) =>
      RegExp(r'[!@#$%^&*(),.?":{}|<>_\-\\[\]/+=~`]').hasMatch(value);

  String _passwordValidationMessage(String value) {
    final List<String> missing = [];

    if (!_hasMinLength(value)) {
      missing.add('8 caracteres');
    }
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

  String? _validateEmail(String? value) {
    final String email = (value ?? '').trim();
    if (email.isEmpty) {
      return 'Campo obrigatorio';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(email)) {
      return 'E-mail invalido';
    }
    return null;
  }
  bool _passwordsMatch() {
    return passwordController.text == confirmPasswordController.text;
  }


  Widget _passwordRuleItem({required String label, required bool isValid}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: isValid ? AppColors.success : AppColors.gray200,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: isValid ? AppColors.success : AppColors.gray200,
            ),
          ),
        ],
      ),
    );
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
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> register() async {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    final String password = passwordController.text;

    if (!_hasMinLength(password) ||
        !_hasUppercase(password) ||
        !_hasNumber(password) ||
        !_hasSpecialChar(password)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_passwordValidationMessage(password))),
      );
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('As senhas nao coincidem')));
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
    final String password = passwordController.text;

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
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(image: AssetImage(AppImages.logoIcon), height: 120),
              const SizedBox(height: 10),
              Text(
                'Crie sua conta',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              Text(
                'Junte-se a comunidade de voluntarios',
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: AppColors.gray200),
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
                onChanged: (_) => setState(() {}),
                suffixIcon: IconButton(
                  icon: Icon(
                    isObscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: toggleObscureText,
                ),
              ),
              const SizedBox(height: 8),
              _passwordRuleItem(
                label: 'Pelo menos 8 caracteres',
                isValid: _hasMinLength(password),
              ),
              const SizedBox(height: 4),
              _passwordRuleItem(
                label: 'Pelo menos 1 letra maiuscula',
                isValid: _hasUppercase(password),
              ),
              const SizedBox(height: 4),
              _passwordRuleItem(
                label: 'Pelo menos 1 numero',
                isValid: _hasNumber(password),
              ),
              const SizedBox(height: 4),
              _passwordRuleItem(
                label: 'Pelo menos 1 caractere especial',
                isValid: _hasSpecialChar(password),
              ),
              const SizedBox(height: 10),
              MainTextField(
                labelText: 'Confirmar senha',
                hintText: 'Confirme sua senha',
                controller: confirmPasswordController,
                suffixIcon: IconButton(
                  icon: Icon(
                    isObscureTextConfirm
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: toggleObscureTextConfirm,
                ),
                obscureText: isObscureTextConfirm,
              ),
              const SizedBox(height: 8),
              _passwordRuleItem(label: 'Senhas não coincidem', isValid: _passwordsMatch()),

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
      ),
    );
  }
}
