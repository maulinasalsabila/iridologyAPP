import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import '../../../data/api/login.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginApi>(() => LoginApi());
    Get.lazyPut<LoginController>(() => LoginController(Get.find<LoginApi>()));
  }
}
