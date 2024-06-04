import 'dart:io';
import 'package:appfinal/app/data/api/classification.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ClassificationController extends GetxController {
  final ClassificationApi _api;

  ClassificationController(this._api);

  var image = Rx<File?>(null);
  var classificationResult = ''.obs;
  var isLoading = false.obs;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImageFromGallery() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        image.value = File(pickedFile.path);
        print('Image selected from gallery: ${pickedFile.path}');
      } else {
        print('No image selected from gallery');
      }
    } catch (e) {
      print('Error picking image from gallery: $e');
    }
  }

  Future<void> takePhoto() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        image.value = File(pickedFile.path);
        print('Image taken from camera: ${pickedFile.path}');
      } else {
        print('No image taken from camera');
      }
    } catch (e) {
      print('Error taking photo: $e');
    }
  }

  Future<void> upload() async {
    if (image.value == null) return;

    isLoading.value = true;

    try {
      final response = await _api.classifyImage(image.value!);
      classificationResult.value = response['message'];
    } catch (e) {
      classificationResult.value = 'Failed to classify image';
    } finally {
      isLoading.value = false;
    }
  }
}
