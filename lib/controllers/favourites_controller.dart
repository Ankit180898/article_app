import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/models/article_model.dart';

class FavoritesController extends GetxController {
  final RxList<Article> favoriteArticles = <Article>[].obs;
  final SharedPreferences sharedPreferences;

  FavoritesController(this.sharedPreferences);

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  void loadFavorites() {
    final favoriteJsonList = sharedPreferences.getStringList('favorites') ?? [];
    favoriteArticles.assignAll(
      favoriteJsonList.map(
        (jsonString) => Article.fromJson(jsonDecode(jsonString)),
      ),
    );
  }

  void saveFavorites() {
    final favoritesToSave =
        favoriteArticles.map((article) => article.toJson()).toList();
    sharedPreferences.setStringList(
      'favorites',
      favoritesToSave.map((json) => jsonEncode(json)).toList(),
    );
  }

  void toggleFavorite(Article article) {
    final index = favoriteArticles.indexWhere((a) => a.id == article.id);
    if (index != -1) {
      favoriteArticles.removeAt(index);
    } else {
      favoriteArticles.add(article);
    }
    saveFavorites();
  }

  bool isFavorite(int articleId) {
    return favoriteArticles.any(
      (favoriteArticle) => favoriteArticle.id == articleId,
    );
  }
}
