import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:via/theme/color.dart';
import 'package:via/widgets/main_card.dart';
import 'package:via/widgets/via_button.dart';

class VolunteerCard extends StatelessWidget {
  final String title;
  final String ong;
  final String category;
  final String distance;
  final String time;
  final String image;
  final VoidCallback onPressed;

  const VolunteerCard({
    super.key,
    required this.title,
    required this.ong,
    required this.category,
    required this.distance,
    required this.time,
    required this.image,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MainCard(
      padding: EdgeInsets.zero,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            width: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Image(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleSmall),
                Text(
                  ong,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(color: AppColors.gray200),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    TextIcon(text: distance, icon: LucideIcons.mapPin),
                    SizedBox(width: 20),
                    TextIcon(text: time, icon: LucideIcons.clock),
                  ],
                ),
                SizedBox(height: 10),
                MainButton(
                  width: double.infinity,
                  label: 'Aplicar',
                  onPressed: onPressed,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TextIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  const TextIcon({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.gray200, size: 16),
        SizedBox(width: 5),
        Text(
          text,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(color: AppColors.gray200),
        ),
      ],
    );
  }
}
