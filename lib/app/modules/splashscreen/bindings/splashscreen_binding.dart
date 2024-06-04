import 'package:get/get.dart';
import '../controllers/splashscreen_controller.dart';
import '../../../data/api/connection_check.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConnectionCheckApi>(() => ConnectionCheckApi());
    Get.lazyPut(() => SplashScreenController(Get.find<ConnectionCheckApi>()));
  }
}
