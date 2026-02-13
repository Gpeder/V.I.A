import 'package:flutter/material.dart';
import 'package:via/data/enum/categories.dart';
import 'package:via/theme/color.dart';

class FilterCategories extends StatefulWidget {
  const FilterCategories({super.key});

  @override
  State<FilterCategories> createState() => _FilterCategoriesState();
}

class _FilterCategoriesState extends State<FilterCategories> {
  final ValueNotifier<Category> selectedCategory = ValueNotifier<Category>(
    Category.all,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: Category.values.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = Category.values[index];

          return ValueListenableBuilder<Category>(
            valueListenable: selectedCategory,
            builder: (context, selectedValue, child) {
              final isSelected = selectedValue == category;

              return GestureDetector(
                onTap: () {
                  selectedCategory.value = category;
                },
                child: Chip(
                  label: Text(
                    category.label,
                    style: Theme.of(context).textTheme.bodyMedium
                  ),
                  backgroundColor: isSelected
                      ? AppColors.primary
                      : AppColors.gray100,
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
