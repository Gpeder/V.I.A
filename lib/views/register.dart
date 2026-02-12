import 'package:flutter/material.dart';
import 'package:via/controller/register_controller.dart';
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
  late final RegisterController controller;

  @override
  void initState() {
    super.initState();
    controller = RegisterController()..addListener(_onControllerChanged);
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

  Future<void> _onRegister() async {
    final String? errorMessage = await controller.register();

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
                textInputAction: TextInputAction.next,
                labelText: 'Nome completo',
                hintText: 'Seu nome',
                controller: controller.nameController,
              ),
              const SizedBox(height: 10),
              MainTextField(
                textInputAction: TextInputAction.next,
                labelText: 'E-mail',
                hintText: 'Seu e-mail',
                keyboardType: TextInputType.emailAddress,
                controller: controller.emailController,
                validator: controller.validateEmail,
              ),
              const SizedBox(height: 10),
              MainTextField(
                textInputAction: TextInputAction.next,
                labelText: 'Senha',
                hintText: 'Sua senha',
                obscureText: controller.isObscureText,
                controller: controller.passwordController,
                onChanged: (_) => controller.onPasswordChanged(),
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.isObscureText
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: controller.toggleObscureText,
                ),
              ),
              const SizedBox(height: 8),
              _passwordRuleItem(
                label: 'Pelo menos 8 caracteres',
                isValid: controller.hasMinLength,
              ),
              const SizedBox(height: 4),
              _passwordRuleItem(
                label: 'Pelo menos 1 letra maiuscula',
                isValid: controller.hasUppercase,
              ),
              const SizedBox(height: 4),
              _passwordRuleItem(
                label: 'Pelo menos 1 numero',
                isValid: controller.hasNumber,
              ),
              const SizedBox(height: 4),
              _passwordRuleItem(
                label: 'Pelo menos 1 caractere especial',
                isValid: controller.hasSpecialChar,
              ),
              const SizedBox(height: 10),
              MainTextField(
                textInputAction: TextInputAction.done,
                labelText: 'Confirmar senha',
                hintText: 'Confirme sua senha',
                controller: controller.confirmPasswordController,
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.isObscureTextConfirm
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: controller.toggleObscureTextConfirm,
                ),
                obscureText: controller.isObscureTextConfirm,
              ),
              const SizedBox(height: 8),
              _passwordRuleItem(
                label: 'Senhas nao coincidem',
                isValid: controller.passwordsMatch,
              ),
              const SizedBox(height: 30),
              MainButton(
                label: 'Criar conta',
                isLoading: controller.isLoading,
                onPressed: _onRegister,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
