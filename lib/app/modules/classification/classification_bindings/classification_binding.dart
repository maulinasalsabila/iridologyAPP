import 'package:appfinal/app/modules/classification/classification_controllers/classification_controller.dart';
import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
import '../../../data/api/classification.dart';

class ClassificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClassificationApi>(() => ClassificationApi());
    Get.lazyPut(() => ClassificationController(Get.find<ClassificationApi>()));
  }
}
