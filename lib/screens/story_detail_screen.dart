import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import '../controllers/story_controller.dart';
import '../models/story.dart';

class StoryDetailScreen extends StatefulWidget {
  final Story story;
  const StoryDetailScreen({super.key, required this.story});

  @override
  State<StoryDetailScreen> createState() => _StoryDetailScreenState();
}

class _StoryDetailScreenState extends State<StoryDetailScreen> {
  int _currentIndex = 0;
  late LiquidController _liquidController;

  @override
  void initState() {
    super.initState();
    _liquidController = LiquidController();
  }

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<StoryController>();
    final total = widget.story.pages.length;

    // 🔹 Buat daftar halaman cerita
    final pages = widget.story.pages
        .map(
          (page) => Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(24),
            color: Theme.of(context).colorScheme.surface,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      page.imagePath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.45,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    page.text,
                    style: GoogleFonts.comicNeue(
                      fontSize: 20,
                      height: 1.6,
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        .toList();

    // 🔹 Tambahkan halaman terakhir “Cerita Selesai”
    pages.add(
      Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.green.shade100,
        child: Center(
          child: Text(
            "✨ Cerita selesai...",
            style: GoogleFonts.comicNeue(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.green.shade800,
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.story.title),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: [
          Obx(
            () => IconButton(
              icon: Icon(
                ctrl.isFavorite(widget.story.id)
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: Colors.redAccent,
              ),
              onPressed: () => ctrl.toggleFavorite(widget.story.id),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          /// 🔹 Efek LiquidSwipe Fullscreen
          LiquidSwipe(
            pages: pages,
            enableLoop: false,
            fullTransitionValue: 500,
            liquidController: _liquidController,
            onPageChangeCallback: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            slideIconWidget: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            enableSideReveal: true,
            waveType: WaveType.liquidReveal,
          ),

          /// 🔹 Overlay Keterangan di Bawah
          Positioned(
            bottom: 32,
            left: 16,
            right: 16,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _currentIndex < total
                      ? 'Halaman ${_currentIndex + 1} dari $total'
                      : '✨ Cerita selesai',
                  style: GoogleFonts.comicNeue(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyMedium?.color,

                    shadows: [
                      Shadow(
                        blurRadius: 6,
                        color: Colors.black.withOpacity(0.6),
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                if (_currentIndex < total)
                  Text(
                    'Geser kanan untuk halaman selanjutnya\nGeser kiri untuk halaman sebelumnya',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.comicNeue(
                      fontSize: 14,
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                      height: 1.3,
                      shadows: [
                        Shadow(
                          blurRadius: 6,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
