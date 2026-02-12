import 'package:flutter/material.dart';

class RegisterController extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isObscureText = true;
  bool isObscureTextConfirm = true;
  bool isLoading = false;

  bool _hasMinLength(String value) => value.length >= 8;
  bool _hasUppercase(String value) => RegExp(r'[A-Z]').hasMatch(value);
  bool _hasNumber(String value) => RegExp(r'\d').hasMatch(value);
  bool _hasSpecialChar(String value) =>
      RegExp(r'[!@#$%^&*(),.?":{}|<>_\-\\[\]/+=~`]').hasMatch(value);

  bool get hasMinLength => _hasMinLength(passwordController.text);
  bool get hasUppercase => _hasUppercase(passwordController.text);
  bool get hasNumber => _hasNumber(passwordController.text);
  bool get hasSpecialChar => _hasSpecialChar(passwordController.text);

  bool get passwordsMatch =>
      passwordController.text == confirmPasswordController.text;

  String passwordValidationMessage(String value) {
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

  void onPasswordChanged() {
    notifyListeners();
  }

  void toggleObscureText() {
    isObscureText = !isObscureText;
    notifyListeners();
  }

  void toggleObscureTextConfirm() {
    isObscureTextConfirm = !isObscureTextConfirm;
    notifyListeners();
  }

  Future<String?> register() async {
    if (!(formKey.currentState?.validate() ?? false)) {
      return 'Verifique os campos obrigatorios.';
    }

    final String password = passwordController.text;

    if (!_hasMinLength(password) ||
        !_hasUppercase(password) ||
        !_hasNumber(password) ||
        !_hasSpecialChar(password)) {
      return passwordValidationMessage(password);
    }

    if (!passwordsMatch) {
      return 'As senhas nao coincidem';
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
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
