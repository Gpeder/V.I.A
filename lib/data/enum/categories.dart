enum Category {
  all,
  education,
  health,
  environment,
  animals,
  social,
  events,
}


extension CategoryExtension on Category {
  String get label {
    switch (this) {
      case Category.all:
        return 'Todas';
      case Category.education:
        return '📚  Educação';
      case Category.health:
        return '👨‍⚕️  Saúde';
      case Category.environment:
        return '🌳  Meio Ambiente';
      case Category.animals:
        return '🐾  Animais';
      case Category.social:
        return '👥  Comunidade / Social';
      case Category.events:
        return '📅  Eventos / Apoio geral';
    }
  }
}
