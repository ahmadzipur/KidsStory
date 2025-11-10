// lib/models/story.dart
class StoryPage {
  final String imagePath; // pake network atau asset path

  StoryPage({required this.imagePath});
}

class Story {
  final String id;
  final String title;
  final String description;
  final String coverImage; // thumbnail untuk grid / carousel
  final List<StoryPage> pages;

  Story({
    required this.id,
    required this.title,
    required this.description,
    required this.coverImage,
    required this.pages,
  });
}
