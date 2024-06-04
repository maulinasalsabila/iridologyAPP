import 'package:get/get.dart';
import '../../../data/api/register.dart';

class RegisterController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;
  var name = ''.obs;
  var address = ''.obs;
  var ttl = ''.obs;
  var sex = ''.obs;
  var isLoading = false.obs;

  final RegisterApi registerService;

  RegisterController(this.registerService);

  void register() async {
    isLoading.value = true;
    try {
      final response = await registerService.registerUser({
        'username': username.value,
        'password': password.value,
        'name': name.value,
        'address': address.value,
        'ttl': ttl.value,
        'sex': sex.value,
      });
      if (response) {
        Get.snackbar('Success', 'Registration successful');
        // Setelah sukses meregister, kembali ke halaman login
        Get.offNamed('/login');
      } else {
        Get.snackbar('Error', 'Registration failed');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void navigateToLogin() {
    Get.toNamed('/login');
  }
}
