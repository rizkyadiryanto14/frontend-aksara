import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:learnaksara/app/data/models/users.dart';
import 'package:learnaksara/app/routes/app_pages.dart';

class AuthenticationController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  var obscureText = true.obs;
  var isLoading = false.obs;
  final box = GetStorage();
  final baseUrl = 'http://172.20.176.1/backend_aksara/auth/login';

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;
    isLoading.value = true;

    try {
      var response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'username': usernameController.text.trim(),
          'password': passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['status'] == true) {
          var userData = jsonResponse['user'];
          User user = User.fromJson(userData);
          box.write('userData', user.toJson());
          Get.offAllNamed(Routes.HOME);
        } else {
          Get.snackbar('Error', 'Login failed: ${jsonResponse['message']}');
        }
      } else {
        Get.snackbar('Error', 'Login failed: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Login failed: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }
}
