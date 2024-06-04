import 'package:get/get.dart';
import '../../../data/api/login.dart';

class LoginController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;
  var isPasswordVisible = false.obs; // Add this line

  final LoginApi loginService;
  LoginController(this.loginService);

  void login() async {
    isLoading.value = true;
    try {
      var response = await loginService.loginUser({
        'username': username.value,
        'password': password.value,
      });
      if (response['message'] == "success") {
        Get.snackbar('Success', 'Login successful');
        // Setelah sukses login, redirect ke halaman home
        Get.offAllNamed('/home');
      } else {
        Get.snackbar('Error', 'Login failed');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void navigateToRegister() {
    Get.toNamed('/register');
  }
}
