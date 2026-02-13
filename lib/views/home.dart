import 'package:flutter/material.dart';
import 'package:via/components/home/appbar.dart';
import 'package:via/components/home/filtercategories.dart';
import 'package:via/components/home/volunteer_card.dart';
import 'package:via/data/models/aplication_model.dart';
import 'package:via/data/models/category_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        padding: .symmetric(vertical: 20),
        child: Column(
          children: [
            //* filto de seleção de categorias
            FilterCategories(),
            SizedBox(height: 20),

            //* lista de cards de trabalhos voluntários
            Padding(
              padding: const .symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final opportunity = mockOpportunities[index];
                      return VolunteerCard(
                        title: opportunity.title,
                        ong: opportunity.ong,
                        category: opportunity.category.label,
                        categoryIcon: opportunity.category.icon,
                        distance: '${opportunity.distance} km',
                        time: opportunity.duration,
                        image: opportunity.image,
                        onPressed: () {},
                      );
                    },
                    itemCount: mockOpportunities.length,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
