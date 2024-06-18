import 'package:get/get.dart';

class PelatihanController extends GetxController {
  final contentData = <Map<String, String>>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the data
    contentData.addAll([
      {
        'title': 'Sejarah Aksara Bima',
        'content': 'Sejarah aksara Bima dimulai dari...',
        'imageUrl': 'https://via.placeholder.com/250',
      },
      {
        'title': 'Aksara Bima',
        'content': 'Aksara Bima adalah...',
        'imageUrl': 'https://via.placeholder.com/250',
      },
      {
        'title': 'Penggunaan Aksara',
        'content': 'Penggunaan aksara ini sangat luas...',
        'imageUrl': 'https://via.placeholder.com/250',
      },
      {
        'title': 'Pelestarian Aksara',
        'content': 'Pelestarian aksara ini dilakukan melalui...',
        'imageUrl': 'https://via.placeholder.com/250',
      },
    ]);
  }
}
