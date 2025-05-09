import 'package:article_app/views/widgets/article_card.dart';
import 'package:article_app/views/widgets/shimmer_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/article_controller.dart';

class ArticlesView extends StatelessWidget {
  const ArticlesView({super.key});

  @override
  Widget build(BuildContext context) {
    final articleController = Get.find<ArticleController>();
    final searchController = TextEditingController();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: searchController,
            decoration: const InputDecoration(
              hintText: 'Search articles...',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (value) {
              articleController.searchArticles(value);
            },
          ),
        ),
        Expanded(child: _buildArticlesList(articleController)),
      ],
    );
  }

  Widget _buildArticlesList(ArticleController articleController) {
    return Obx(() {
      if (articleController.isLoading.value) {
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: 10,
          itemBuilder: (context, index) => const ShimmerLoading(),
        );
      }

      if (articleController.hasError.value) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 60, color: Colors.red),
              const SizedBox(height: 16),
              Text(
                'Error: ${articleController.errorMessage.value}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => articleController.fetchArticles(),
                child: const Text('Try Again'),
              ),
            ],
          ),
        );
      }

      if (articleController.filteredArticles.isEmpty) {
        return const Center(child: Text('No articles found'));
      }

      return RefreshIndicator(
        onRefresh: () => articleController.fetchArticles(),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: articleController.filteredArticles.length,
          itemBuilder: (context, index) {
            final article = articleController.filteredArticles[index];
            return ArticleCard(article: article);
          },
        ),
      );
    });
  }
}
