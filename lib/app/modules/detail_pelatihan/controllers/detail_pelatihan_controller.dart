import 'package:get/get.dart';

class DetailPelatihanController extends GetxController {
  final title = ''.obs;
  final content = ''.obs;
  final imageUrl = ''.obs;

  void setData(String title, String content, String imageUrl) {
    this.title.value = title;
    this.content.value = content;
    this.imageUrl.value = imageUrl;
  }
}
