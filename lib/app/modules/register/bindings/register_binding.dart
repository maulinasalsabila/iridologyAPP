import 'package:get/get.dart';
import '../controllers/register_controller.dart';
import '../../../data/api/register.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterApi>(() => RegisterApi());
    Get.lazyPut<RegisterController>(
        () => RegisterController(Get.find<RegisterApi>()));
  }
}
