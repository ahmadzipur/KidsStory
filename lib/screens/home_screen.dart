// lib/screens/home_screen.dart
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/story_controller.dart';
import '../widgets/story_card.dart';
import 'story_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final storyCtrl = Get.find<StoryController>();
    return SafeArea(
      child: ListView(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.amberAccent, // warna background
              borderRadius: BorderRadius.circular(12), // sudut melengkung
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                16,
                8,
                16,
                8,
              ), // left, top, right, bottom
              child: Text(
                'Cerita Unggulan',
                style: GoogleFonts.comicNeue(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 240,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.6,
              // aspectRatio: 16 / 9,
              autoPlayInterval: const Duration(seconds: 4),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
            ),
            items: storyCtrl.storiesList.map((s) {
              return Builder(
                builder: (ctx) => GestureDetector(
                  onTap: () => Get.to(() => StoryDetailScreen(story: s)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      s.coverImage,
                      height: 120,
                      fit: BoxFit.cover,
                      width:
                          MediaQuery.of(ctx).size.width *
                          1.0, // sesuaikan viewportFraction
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 8),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.amberAccent, // warna background
              borderRadius: BorderRadius.circular(12), // sudut melengkung
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                16,
                8,
                16,
                8,
              ), // left, top, right, bottom
              child: Text(
                'Daftar Cerita',
                style: GoogleFonts.comicNeue(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              10,
              4,
              10,
              4,
            ), // left, top, right, bottom
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: storyCtrl.storiesList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final s = storyCtrl.storiesList[index];
                return StoryCard(
                  story: s,
                  onTap: () => Get.to(() => StoryDetailScreen(story: s)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
