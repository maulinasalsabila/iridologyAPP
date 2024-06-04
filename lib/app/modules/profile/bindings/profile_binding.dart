import 'package:appfinal/app/data/api/profile.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileApi>(() => ProfileApi());
    Get.lazyPut<ProfileController>(
        () => ProfileController(Get.find<ProfileApi>()));
  }
}
