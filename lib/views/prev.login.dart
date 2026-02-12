import 'package:flutter/material.dart';
import 'package:via/theme/color.dart';
import 'package:via/theme/images.dart';
import 'package:via/widgets/via_button.dart';

class PrevLogin extends StatelessWidget {
  const PrevLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: .symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: .center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.25),
            Image(image: AssetImage(AppImages.logoIcon), height: 120),
            SizedBox(height: 20),
            Text(
              'Bem vindo ao V.I.A',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 10),
            Text(
              'Conecte-se a oportunidades de voluntariado perto de você e transforme vidas — inclusive a sua. ',
              textAlign: .center,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(color: AppColors.gray200),
            ),
            SizedBox(height: 40),
            MainButton(
              label: 'Começar',
              onPressed: () {
                Navigator.pushNamed(context, '/cadastro');
              },
              width: double.infinity,
            ),
            SizedBox(height: 10),
            MainButton(
              label: 'Já possuo conta',
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              width: double.infinity,
              variant: MainButtonVariant.outline,
            ),
            SizedBox(height: 20),
            Text(
              'Junte-se a milhares de voluntários',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(color: AppColors.gray200),
            ),
          ],
        ),
      ),
    );
  }
}
