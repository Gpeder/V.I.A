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

const List<CategoryModel> mockCategories = [
  CategoryModel(
    id: CategoryId.education,
    label: 'Educação',
    icon: '📚',
  ),
  CategoryModel(
    id: CategoryId.environment,
    label: 'Meio Ambiente',
    icon: '🌱',
  ),
  CategoryModel(
    id: CategoryId.health,
    label: 'Saúde',
    icon: '❤️',
  ),
  CategoryModel(
    id: CategoryId.animals,
    label: 'Animais',
    icon: '🐾',
  ),
  CategoryModel(
    id: CategoryId.elderly,
    label: 'Idosos',
    icon: '👴',
  ),
  CategoryModel(
    id: CategoryId.children,
    label: 'Crianças',
    icon: '👶',
  ),
  CategoryModel(
    id: CategoryId.food,
    label: 'Alimentação',
    icon: '🍽️',
  ),
  CategoryModel(
    id: CategoryId.culture,
    label: 'Cultura',
    icon: '🎨',
  ),
];

extension CategoryIdExtension on CategoryId {
  String get label {
    return mockCategories.firstWhere((c) => c.id == this).label;
  }

  String get icon {
    return mockCategories.firstWhere((c) => c.id == this).icon;
  }
}