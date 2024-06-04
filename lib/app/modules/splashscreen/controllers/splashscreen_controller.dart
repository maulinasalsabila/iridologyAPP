import 'package:get/get.dart';
import '../../../data/api/connection_check.dart';

class SplashScreenController extends GetxController {
  var isLoading = true.obs;
  final ConnectionCheckApi checkService;

  SplashScreenController(this.checkService);

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 1), () {
      checkToken();
      isLoading(false);
    });
  }


  Future<void> checkToken() async {
    final response = await checkService.connectionCheck();
    print(response);
    if (response) {
      Get.offNamed('/home');
    } else {
      Get.offNamed('/login');
    }
  }
}
