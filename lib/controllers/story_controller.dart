// lib/controllers/story_controller.dart
import 'package:get/get.dart';

import '../data/stories_data.dart';
import '../models/story.dart';

class StoryController extends GetxController {
  // semua story (read-only dari data lokal)
  final storiesList = stories.obs;

  // favorit (list of ids)
  final favoriteIds = <String>[].obs;

  void toggleFavorite(String storyId) {
    if (favoriteIds.contains(storyId)) {
      favoriteIds.remove(storyId);
    } else {
      favoriteIds.add(storyId);
    }
  }

  bool isFavorite(String storyId) => favoriteIds.contains(storyId);

  Story? findById(String id) => storiesList.firstWhereOrNull((s) => s.id == id);
}
