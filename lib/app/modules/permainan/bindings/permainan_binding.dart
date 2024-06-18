import 'package:get/get.dart';

import '../controllers/permainan_controller.dart';

class PermainanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PermainanController>(
      () => PermainanController(),
    );
  }
}
