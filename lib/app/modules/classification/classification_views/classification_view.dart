import 'package:appfinal/app/modules/classification/classification_controllers/classification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClassificationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ClassificationController controller = Get.find();

    return Scaffold(
      backgroundColor: Color(0xFFF9E8C9),
      appBar: AppBar(
        backgroundColor: Color(0xFF201658),
        title: Text('Classification', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white), // Set back button color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Obx(() {
                if (controller.image.value != null) {
                  return Image.file(controller.image.value!);
                } else {
                  return Container(
                    color: Colors.grey[100],
                    child: Center(
                      child: Text('No Image Selected'),
                    ),
                  );
                }
              }),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    controller.pickImageFromGallery();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF201658), // Button background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('Pick from Gallery',
                      style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.takePhoto();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF201658),
                    // Button background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Take a Photo',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Obx(() {
              if (controller.isLoading.value) {
                return CircularProgressIndicator();
              } else {
                return Obx(() {
                  bool isImageSelected = controller.image.value != null;
                  return ElevatedButton(
                    onPressed:
                        isImageSelected ? () => controller.upload() : null,
                    style: ElevatedButton.styleFrom(
                      primary: isImageSelected
                          ? Color(0xFF201658)
                          : Colors.grey, // Button color changes
                      onPrimary: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text('Classify'),
                  );
                });
              }
            }),
            SizedBox(height: 16),
            Obx(() {
              return Text(controller.classificationResult.value);
            }),
          ],
        ),
      ),
    );
  }
}
