import 'package:appfinal/app/data/api/home.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  final HomeApi checkService;
  HomeController(this.checkService);

  var greetingMessage = ''.obs;
  @override
  void onInit() {
    super.onInit();
    greetingHome();
  }

  Future<void> greetingHome() async {
    final response = await checkService.getHome();
    if (response != 'failed') {
      greetingMessage.value = response['message'];
    } else {
      removeAccessToken();
      Get.offAllNamed('/login');
    }
  }

  void onProfileButtonPressed() {
    // Logic to navigate to profile
    Get.toNamed('/profile');
  }

  void onRekamMedisButtonPressed() {
    // Logic to navigate to rekam medis
    Get.toNamed('/record');
  }

  void onKlasifikasiDiabetesButtonPressed() {
    // Logic to navigate to klasifikasi diabetes
    Get.toNamed('/classification');
  }

  void onLogoutButtonPressed() {
    removeAccessToken();
    Get.offAllNamed('/login'); // Navigate to login and clear stack
  }

  Future<void> removeAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
  }
}
