enum CategoryId {
  education,
  environment,
  health,
  animals,
  elderly,
  children,
  food,
  culture,
}

class CategoryModel {
  final CategoryId id;
  final String label;
  final String icon;

  const CategoryModel({
    required this.id,
    required this.label,
    required this.icon,
  });
}
