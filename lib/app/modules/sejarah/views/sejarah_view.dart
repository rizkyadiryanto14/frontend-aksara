import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sejarah_controller.dart';

class SejarahView extends GetView<SejarahController> {
  const SejarahView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SejarahView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SejarahView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
