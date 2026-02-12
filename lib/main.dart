import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:via/theme/color.dart';
import 'package:via/theme/text.dart';

void main() {
  runApp(const Via());
}

class Via extends StatelessWidget {
  const Via({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = mainTextTheme();

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        scaffoldBackgroundColor: const Color(0xFFF3F4F6),
        primaryColor: AppColors.primary,
        useMaterial3: true,
        textTheme: textTheme,
        chipTheme: ChipThemeData(
          backgroundColor: AppColors.primary,
          selectedColor: AppColors.primary,
          disabledColor: AppColors.gray100,
          labelStyle: textTheme.bodyMedium ??
              const TextStyle(fontSize: 14, color: AppColors.black),
          elevation: 1,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: AppColors.gray100, width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              Chip(label: Text('Hello World')),
            ],
          ),
        ),
      ),
    );
  }
}
