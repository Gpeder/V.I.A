import 'package:via/theme/images.dart';

import 'category_model.dart';

class OpportunityModel {
  final String id;
  final String title;
  final String ong;
  final String description;
  final CategoryId category;
  final double distance;
  final String duration;
  final String location;
  final double lat;
  final double lng;
  final String date;
  final int spots;
  final String _image;

  const OpportunityModel({
    required this.id,
    required this.title,
    required this.ong,
    required this.description,
    required this.category,
    required this.distance,
    required this.duration,
    required this.location,
    required this.lat,
    required this.lng,
    required this.date,
    required this.spots,
    required String image,
  }) : _image = image;

  String get image {
    if (_image.isNotEmpty) return _image;

    switch (category) {
      case CategoryId.education:
        return AppImages.educacao;
      case CategoryId.environment:
        return AppImages.meioAmbiente;
      case CategoryId.health:
        return AppImages.saude;
      case CategoryId.animals:
        return AppImages.animal;
      case CategoryId.elderly:
      case CategoryId.children:
        return AppImages.social;
      case CategoryId.food:
        return AppImages.alimentacao;
      case CategoryId.culture:
        return AppImages.geral;
    }
  }
}

const List<OpportunityModel> mockOpportunities = [
  OpportunityModel(
    id: "1",
    title: "Aulas de Reforço Escolar",
    ong: "Instituto Educar",
    description:
        "Ajude crianças de comunidades carentes com reforço em matemática e português. Você fará a diferença na vida de jovens estudantes que precisam de apoio extra para acompanhar o conteúdo escolar.",
    category: CategoryId.education,
    distance: 1.2,
    duration: "2h",
    location: "Rua das Flores, 123 - Vila Mariana, SP",
    lat: -23.5892,
    lng: -46.6388,
    date: "Sábados, 9h-11h",
    spots: 5,
    image: "",
  ),
  OpportunityModel(
    id: "2",
    title: "Plantio de Árvores no Parque",
    ong: "Verde Vida",
    description:
        "Participe de um mutirão de plantio de árvores nativas no Parque Ibirapuera. Uma ótima oportunidade para contribuir com o meio ambiente e aprender sobre espécies nativas da Mata Atlântica.",
    category: CategoryId.environment,
    distance: 3.5,
    duration: "4h",
    location: "Parque Ibirapuera - Portão 3",
    lat: -23.5874,
    lng: -46.6576,
    date: "Domingo, 8h-12h",
    spots: 20,
    image: "",
  ),
  OpportunityModel(
    id: "3",
    title: "Visita a Idosos em Asilo",
    ong: "Abraço Solidário",
    description:
        "Faça companhia a idosos em abrigo, converse, jogue jogos de tabuleiro e leve alegria a quem precisa de carinho e atenção.",
    category: CategoryId.elderly,
    distance: 0.8,
    duration: "3h",
    location: "Av. Paulista, 900 - Bela Vista, SP",
    lat: -23.5631,
    lng: -46.6544,
    date: "Quartas, 14h-17h",
    spots: 8,
    image: "",
  ),
  OpportunityModel(
    id: "4",
    title: "Feira de Doação de Alimentos",
    ong: "Mesa Cheia",
    description:
        "Ajude na organização e distribution de alimentos para famílias em situação de vulnerabilidade. Cada doação faz a diferença!",
    category: CategoryId.food,
    distance: 2.1,
    duration: "5h",
    location: "Praça da Sé - Centro, SP",
    lat: -23.5505,
    lng: -46.6340,
    date: "Sábado, 7h-12h",
    spots: 15,
    image: "",
  ),
  OpportunityModel(
    id: "5",
    title: "Cuidado de Animais Resgatados",
    ong: "Patas Felizes",
    description:
        "Ajude a cuidar de cães e gatos resgatados das ruas. Atividades incluem banho, passeios e socialização dos animais para facilitar a adoção.",
    category: CategoryId.animals,
    distance: 4.0,
    duration: "3h",
    location: "Rua Augusta, 500 - Consolação, SP",
    lat: -23.5556,
    lng: -46.6600,
    date: "Domingos, 10h-13h",
    spots: 10,
    image: "",
  ),
  OpportunityModel(
    id: "6",
    title: "Oficina de Arte com Crianças",
    ong: "Criança Criativa",
    description:
        "Conduza oficinas de pintura e desenho para crianças de 5 a 12 anos. Estimule a criatividade e expressão artística dos pequenos!",
    category: CategoryId.children,
    distance: 1.8,
    duration: "2h",
    location: "Casa de Cultura - Pinheiros, SP",
    lat: -23.5670,
    lng: -46.6910,
    date: "Sextas, 15h-17h",
    spots: 3,
    image: "",
  ),
];
