import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/detail_pelatihan_controller.dart';

class DetailPelatihanView extends GetView<DetailPelatihanController> {
  const DetailPelatihanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.title.value)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    controller.imageUrl.value,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                )),
            const SizedBox(height: 16),
            Obx(() => Text(
                  controller.title.value,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                )),
            const SizedBox(height: 16),
            Obx(() => Text(
                  controller.content.value,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
