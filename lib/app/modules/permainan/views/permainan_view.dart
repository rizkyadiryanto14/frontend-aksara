import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/permainan_controller.dart';

class PermainanView extends GetView<PermainanController> {
  const PermainanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PermainanView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PermainanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
