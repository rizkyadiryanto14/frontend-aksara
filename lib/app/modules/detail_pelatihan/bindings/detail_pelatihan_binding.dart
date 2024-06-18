import 'package:get/get.dart';

import '../controllers/detail_pelatihan_controller.dart';

class DetailPelatihanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPelatihanController>(
      () => DetailPelatihanController(),
    );
  }
}
