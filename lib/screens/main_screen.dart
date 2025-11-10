// lib/screens/main_page.dart
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/theme_controller.dart';
import 'favorite_screen.dart';
import 'home_screen.dart';
import 'settings_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ThemeController themeController = Get.find();
  int selectedIndex = 0;

  final pages = const [HomeScreen(), FavoriteScreen(), SettingsScreen()];

  @override
  void initState() {
    super.initState();

    // Kunci orientasi ke potrait saat halaman ini aktif
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kids Story',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green, // 🎨 ubah warna latar
        foregroundColor: Colors.white, // 🖋 ubah warna teks & ikon
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        child: pages[selectedIndex],
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        backgroundColor: Colors.green,
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.favorite, title: 'Favorit'),
          TabItem(icon: Icons.settings, title: 'Settings'),
        ],
        initialActiveIndex: selectedIndex,
        onTap: (i) => setState(() => selectedIndex = i),
      ),
    );
  }
}
