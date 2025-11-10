import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/theme_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Settings",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Obx(
              () => SwitchListTile(
                title: const Text("Dark Mode"),
                subtitle: const Text("Aktifkan mode malam"),
                value: themeController.isDarkMode.value,
                onChanged: (v) => themeController.toggleTheme(v),
              ),
            ),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              "Tentang Aplikasi",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              "KidsStory adalah aplikasi edukatif berbasis mobile yang dirancang khusus untuk anak-anak agar dapat belajar nilai moral, budi pekerti, dan imajinasi melalui cerita-cerita pendek yang menarik dan interaktif."
              "Didesain untuk melatih imajinasi dan minat baca anak. KidsStory tidak hanya menghadirkan pengalaman membaca yang menyenangkan, tetapi juga mendidik anak-anak untuk memahami nilai-nilai kehidupan melalui narasi yang ringan dan mudah dipahami."
              "Setiap cerita dilengkapi dengan ilustrasi berwarna cerah dan fitur interaktif yang mendorong anak untuk aktif berpartisipasi selama membaca."
              "Materi cerita yang disajikan dalam aplikasi ini diambil dari Bookbot.id, sebuah platform literasi anak yang menyediakan konten edukatif berkualitas dan sesuai dengan tingkat perkembangan usia."
              "Dengan demikian, KidsStory menjadi sarana yang ideal bagi orang tua dan guru dalam menumbuhkan kebiasaan membaca serta memperkaya wawasan moral anak sejak dini.",
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
