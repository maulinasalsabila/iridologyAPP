import 'package:appfinal/app/data/api/home.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeApi>(() => HomeApi());
    Get.lazyPut<HomeController>(() => HomeController(Get.find<HomeApi>()));
  }
}
