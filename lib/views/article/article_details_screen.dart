import 'package:article_app/controllers/favourites_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/article_model.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final Article article;
  
  const ArticleDetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final favoritesController = Get.find<FavoritesController>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article Details'),
        actions: [
          Obx(() => IconButton(
            icon: Icon(
              favoritesController.isFavorite(article.id)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: favoritesController.isFavorite(article.id)
                  ? Colors.red
                  : null,
            ),
            onPressed: () {
              favoritesController.toggleFavorite(article);
            },
          )),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Author ID: ${article.userId}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            Text(
              article.body,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}