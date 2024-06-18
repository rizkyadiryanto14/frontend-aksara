import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:learnaksara/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final baseUrl = 'http://172.20.176.1/backend_aksara/auth/register';

  var obscureText = true.obs;
  var isLoading = false.obs;

  late TextEditingController usernameController;
  late TextEditingController passwordController;
  late TextEditingController namaController;
  late TextEditingController emailController;

  @override
  void onInit() {
    super.onInit();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    namaController = TextEditingController();
    emailController = TextEditingController();
  }

  Future<void> register() async {
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
          'nama': namaController.text.trim(),
          'email': emailController.text.trim()
        }),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['status'] == true) {
          Get.snackbar(
            'Sukses',
            'Registrasi berhasil!',
            snackPosition: SnackPosition.TOP,
            duration: const Duration(
              seconds: 3,
            ),
          );
          Future.delayed(const Duration(seconds: 3), () {
            Get.offAllNamed(Routes.AUTHENTICATION);
          });
        } else {
          Get.snackbar(
            'Error',
            'Register Failed  : ${jsonResponse['message']}',
            backgroundColor: Colors.red,
          );
        }
      } else {
        Get.snackbar(
          'Error',
          'Register Failed: ${response.statusCode}',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar('Error', 'Login failed: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }
}
