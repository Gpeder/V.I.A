import 'package:flutter/material.dart';
import 'package:via/theme/images.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image(image: AssetImage(AppImages.logoIcon), height: 80),
      ),
      body: const Center(
        child: Text('Bem-vindo à página inicial!'),
      ),
    );
  }
}