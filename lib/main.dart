import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/story_controller.dart';
import 'controllers/theme_controller.dart';
import 'screens/splash_screen.dart';

void main() {
  Get.put(StoryController());
  Get.put(ThemeController());
  runApp(const KidsStoryApp());
}

class KidsStoryApp extends StatelessWidget {
  const KidsStoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Obx(() => GetMaterialApp(
          title: 'KidsStory',
          debugShowCheckedModeBanner: false,
          themeMode:
              themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
          theme: ThemeData(
            primarySwatch: Colors.pink,
            brightness: Brightness.light,
            fontFamily: 'ComicNeue',
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'ComicNeue',
            colorScheme: const ColorScheme.dark(primary: Colors.pinkAccent),
          ),
          home: const SplashScreen(),
        ));
  }
}
