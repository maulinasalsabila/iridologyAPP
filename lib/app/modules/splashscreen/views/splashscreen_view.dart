import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splashscreen_controller.dart';

class SplashScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final SplashScreenController controller = Get.find();

    return Scaffold(
      // ignore: deprecated_member_use
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Center(
            child: Image.asset(
              "assets/images/splash.gif",
            ),
            // Text('Loading complete!'), // This is just a placeholder
          );
        }
      }),
    );
  }
}
