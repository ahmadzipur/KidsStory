// lib/screens/favorite_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/story_controller.dart';
import 'story_detail_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<StoryController>();
    return Obx(() {
      final favIds = ctrl.favoriteIds;
      if (favIds.isEmpty) {
        return Center(
          child: Text(
            'Belum ada cerita favorit.',
            style: GoogleFonts.comicNeue(fontSize: 16),
          ),
        );
      }
      final favStories = ctrl.storiesList
          .where((s) => favIds.contains(s.id))
          .toList(growable: false);
      return ListView.builder(
        itemCount: favStories.length,
        itemBuilder: (context, index) {
          final s = favStories[index];
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(s.coverImage, width: 56, fit: BoxFit.cover),
            ),
            title: Text(s.title, style: GoogleFonts.comicNeue()),
            subtitle: Text(s.description),
            onTap: () => Get.to(() => StoryDetailScreen(story: s)),
          );
        },
      );
    });
  }
}
