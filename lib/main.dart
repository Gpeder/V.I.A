import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:via/theme/chip.dart';
import 'package:via/theme/color.dart';
import 'package:via/theme/text.dart';
import 'package:via/views/login.dart';
import 'package:via/views/prev.login.dart';
import 'package:via/views/register.dart';

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
        useMaterial3: true,
        fontFamily: GoogleFonts.poppins().fontFamily,
        scaffoldBackgroundColor: const Color(0xFFF3F4F6),
        primaryColor: AppColors.primary,
        textTheme: textTheme,
        chipTheme: chip(textTheme),

        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            overlayColor: Colors.transparent,
          ),
        ),
        appBarTheme: AppBarTheme(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.black),
        ),
      ),
      initialRoute: '/prevLogin',

      routes: {
        '/prevLogin': (context) => const PrevLogin(),
        '/cadastro': (context) => const Register(),
        '/login': (context) => const Login(),
      },
    );
  }
}
