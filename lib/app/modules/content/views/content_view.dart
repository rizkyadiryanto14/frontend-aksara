import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/content_controller.dart';

class ContentView extends GetView<ContentController> {
  const ContentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ContentView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ContentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
