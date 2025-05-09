import 'package:article_app/controllers/favourites_controller.dart';
import 'package:article_app/views/article/article_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/article_model.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final favoritesController = Get.find<FavoritesController>();

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Card(
        child: InkWell(
          onTap: () {
            Get.to(() => ArticleDetailsScreen(article: article));
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        article.title,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Obx(
                      () => IconButton(
                        icon: Icon(
                          favoritesController.isFavorite(article.id)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color:
                              favoritesController.isFavorite(article.id)
                                  ? Colors.red
                                  : null,
                        ),
                        onPressed: () {
                          favoritesController.toggleFavorite(article);
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  article.body,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
