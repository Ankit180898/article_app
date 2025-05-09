import 'package:article_app/views/article/article_sceen.dart';
import 'package:article_app/views/favourites/favourites_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/navigation_controller.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Add navigation controller
    final navigationController = Get.put(NavigationController());
    
    // Pages to display in the bottom navigation
    final pages = [
      const ArticlesView(),
      const FavoritesScreen(),
    ];
    
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(
          navigationController.selectedIndex.value == 0 ? 'Articles' : 'Favorites'
        )),
      ),
      body: Obx(() => pages[navigationController.selectedIndex.value]),
      bottomNavigationBar: Obx(() => NavigationBar(
        selectedIndex: navigationController.selectedIndex.value,
        onDestinationSelected: (index) {
          navigationController.changePage(index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.article_outlined),
            selectedIcon: Icon(Icons.article),
            label: 'Articles',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_outline),
            selectedIcon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      )),
    );
  }
}