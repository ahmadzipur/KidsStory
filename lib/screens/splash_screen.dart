// lib/screens/splash_screen.dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // animasi fade in
    Timer(const Duration(milliseconds: 200), () {
      setState(() => opacity = 1.0);
    });
    // lanjut ke main page setelah 2.5 detik
    Timer(const Duration(milliseconds: 2500), () {
      Get.off(() => const MainPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        opacity: opacity,
        duration: const Duration(milliseconds: 800),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(
                  4,
                ), // jarak antara border dan gambar
                decoration: BoxDecoration(
                  color:
                      Colors.white, // background di belakang gambar (opsional)
                  border: Border.all(
                    color: Colors.green,
                    width: 3, // tebal garis pinggir
                  ),
                  borderRadius: BorderRadius.circular(20), // sudut melengkung
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: const Offset(2, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/icons/app_icon.png',
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Text(
                'Kids Story',
                style: GoogleFonts.comicNeue(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Cerita Edukasi Anak',
                style: GoogleFonts.comicNeue(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
