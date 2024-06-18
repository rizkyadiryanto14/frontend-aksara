import 'package:get/get.dart';

import '../controllers/sejarah_controller.dart';

class SejarahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SejarahController>(
      () => SejarahController(),
    );
  }
}
