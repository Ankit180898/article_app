import 'dart:convert';

import 'package:article_app/controllers/favourites_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:http/http.dart' as http;
import '../data/models/article_model.dart';
import '../core/constants.dart';

class ArticleController extends GetxController {
  final RxList<Article> articles = <Article>[].obs;
  final RxList<Article> filteredArticles = <Article>[].obs;
  final RxBool isLoading = false.obs;
  final TextEditingController searchController = TextEditingController();
  final errorMessage = ''.obs;
  final hasError = false.obs;
  final debounce = Debouncer(delay: const Duration(milliseconds: 300));

  @override
  void onInit() {
    fetchArticles();
    super.onInit();
  }

  Future<void> fetchArticles() async {
    try {
      isLoading.value = true;
      final response = await http.get(
        Uri.parse(ApiConstants.baseUrl + ApiConstants.posts),
      );
      if (response.statusCode == 200) {
        isLoading.value = false;
        List<dynamic> data = jsonDecode(response.body);
        debugPrint(data.toString());
        articles.value = data.map((json) => Article.fromJson(json)).toList();
        filteredArticles.value = articles;
        searchController.clear();
      }
    } catch (e) {
      isLoading.value = false;
      errorMessage.value = e.toString();
      hasError.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  void searchArticles(String query) {
    if (query.isEmpty) {
      filteredArticles.value = articles;
      return;
    }
    final searchQuery = query.toLowerCase();
    debounce(() {
      filteredArticles.value =
          articles
              .where(
                (article) =>
                    article.title.toLowerCase().contains(searchQuery) ||
                    article.body.toLowerCase().contains(searchQuery),
              )
              .toList();
    });
  }

  void clearSearch() {
    filteredArticles.value = articles;
  }

  void toggleFavorite(Article article) {
    final favoritesController = Get.find<FavoritesController>();
    favoritesController.toggleFavorite(article);
  }
}
