

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


import '../model/model_class.dart';
import '../service/api_service.dart';

class NewsController extends GetxController {
  final ApiService apiService = ApiService();

  var articles = <Article>[].obs;
  var isLoading = false.obs;
  var category = "business".obs;

  /// Fetch news by category
  Future<void> getArticles(String selectedCategory) async {
    try {
      isLoading(true);
      category.value = selectedCategory;
      final data = await apiService.fetchArticles(selectedCategory);
      articles.assignAll(data);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }

  /// Search news
  Future<void> searchNews(String query) async {
    try {
      isLoading(true);
      final data = await apiService.searchArticles(query);
      articles.assignAll(data);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
