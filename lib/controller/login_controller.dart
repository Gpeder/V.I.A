import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isObscurePassword = true;
  bool isLoading = false;

  String? validateEmail(String? value) {
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

  String? validatePassword(String? value) {
    final String password = value ?? '';
    if (password.isEmpty) {
      return 'Campo obrigatorio';
    }
    return null;
  }

  void togglePasswordVisibility() {
    isObscurePassword = !isObscurePassword;
    notifyListeners();
  }

  Future<String?> login() async {
    if (!(formKey.currentState?.validate() ?? false)) {
      return 'Verifique os campos obrigatorios.';
    }

    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    isLoading = false;
    notifyListeners();

    return null;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
