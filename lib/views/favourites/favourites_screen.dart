import 'package:article_app/controllers/favourites_controller.dart';
import 'package:article_app/views/widgets/article_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesController = Get.find<FavoritesController>();
    
    return Obx(() {
      if (favoritesController.favoriteArticles.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.favorite_border, size: 60, color: Colors.grey),
              const SizedBox(height: 16),
              Text(
                'No favorite articles yet',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Tap the heart icon on any article to add it to favorites',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        );
      }
      
      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: favoritesController.favoriteArticles.length,
        itemBuilder: (context, index) {
          final article = favoritesController.favoriteArticles[index];
          return ArticleCard(article: article);
        },
      );
    });
  }
}