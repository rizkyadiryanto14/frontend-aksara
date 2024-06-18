import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:learnaksara/app/data/models/users.dart';

class HomeController extends GetxController {
  final box = GetStorage();
  var user = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    _loadUserData();
  }

  void _loadUserData() {
    var userData = box.read('userData');
    if (userData != null) {
      user.value = User.fromJson(userData);
      print("User Data : ${user.value?.role}");
    } else {
      Get.offAllNamed('/authentication');
    }
  }

  void logout() {
    box.remove('userData');
    Get.offAllNamed('/authentication');
  }
}
