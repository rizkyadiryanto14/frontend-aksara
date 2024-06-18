import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnaksara/app/modules/detail_pelatihan/controllers/detail_pelatihan_controller.dart';
import 'package:learnaksara/app/modules/detail_pelatihan/views/detail_pelatihan_view.dart';
import 'package:learnaksara/app/modules/pelatihan/controllers/pelatihan_controller.dart';

class PelatihanView extends GetView<PelatihanController> {
  const PelatihanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pelatihan Aksara'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          if (controller.contentData.isEmpty) {
            return const Center(
              child: Text('No content available'),
            );
          } else {
            return ListView.builder(
              itemCount: controller.contentData.length,
              itemBuilder: (context, index) {
                final data = controller.contentData[index];
                return GestureDetector(
                  onTap: () {
                    final detailController =
                        Get.put(DetailPelatihanController());
                    detailController.setData(
                      data['title']!,
                      data['content']!,
                      data['imageUrl']!,
                    );
                    Get.to(() => const DetailPelatihanView());
                  },
                  child: _buildContentCard(
                    title: data['title']!,
                    content: data['content']!,
                    imageUrl: data['imageUrl']!,
                  ),
                );
              },
            );
          }
        }),
      ),
    );
  }

  Widget _buildContentCard({
    required String title,
    required String content,
    required String imageUrl,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imageUrl,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
