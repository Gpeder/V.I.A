import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:via/theme/color.dart';
import 'package:via/theme/images.dart';
import 'package:via/widgets/main_searchbar.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  static const String _defaultUserName = 'John Doe';

  String _getInitials(String fullName) {
    final parts = fullName
        .trim()
        .split(RegExp(r'\s+'))
        .where((part) => part.isNotEmpty)
        .toList();

    if (parts.isEmpty) return 'JD';
    if (parts.length == 1) return parts.first[0].toUpperCase();

    return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
  }

  @override
  Size get preferredSize => const Size.fromHeight(152);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      automaticallyImplyLeading: false,
      toolbarHeight: 80,
      actionsPadding: const EdgeInsets.only(right: 16),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: AppColors.primary,
            child: Text(
              _getInitials(_defaultUserName),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.primaryNearBlack,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Image(image: AssetImage(AppImages.logoHorizontal), height: 100),

          IconButton(
            iconSize: 24,
            style: IconButton.styleFrom(
              padding: .all(12),
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: const Icon(
              LucideIcons.slidersHorizontal,
              color: AppColors.primaryNearBlack,
            ),
            onPressed: () {},
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
          child: MainSearchBar(
            variant: MainSearchBarVariant.filled,
            hintText: 'Pesquisar por produtos, marcas e muito mais',
            onChanged: (value) {},
          ),
        ),
      ),
    );
  }
}
