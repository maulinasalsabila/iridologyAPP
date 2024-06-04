import 'package:appfinal/app/data/api/profile.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  final ProfileApi profileService;
  ProfileController(this.profileService);

  var isEditing = false.obs;
  var isModified = false.obs;

  var password = ''.obs;
  var name = ''.obs;
  var address = ''.obs;
  var ttl = ''.obs;
  var sex = ''.obs;
  var username = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProfile();
  }

  void toggleEditMode() {
    isEditing.value = !isEditing.value;
    isModified.value = false;
  }

  void updateField(String field, String value) {
    switch (field) {
      case 'password':
        password.value = value;
        break;
      case 'name':
        name.value = value;
        break;
      case 'address':
        address.value = value;
        break;
      case 'ttl':
        ttl.value = value;
        break;
      case 'sex':
        sex.value = value;
        break;
      case 'username':
        username.value = value;
        break;
    }
    isModified.value = true;
  }

  Future<void> saveProfile() async {
    final response = await profileService.editProfile({
      'password': password.value,
      'name': name.value,
      'address': address.value,
      'ttl': ttl.value,
      'sex': sex.value,
      'username': username.value,
    });

    if (response) {
      isEditing.value = false;
      isModified.value = false;
      Get.snackbar('Success', 'Data Updated');
    } else {
      // Handle error
    }
  }

  Future<void> fetchProfile() async {
    final response = await profileService.showProfile();
    if (response != 'failed') {
      password.value = response['data']['password'];
      name.value = response['data']['name'];
      address.value = response['data']['address'];
      ttl.value = response['data']['ttl'];
      sex.value = response['data']['sex'];
      username.value = response['data']['username'];
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('access_token');
      Get.offAllNamed('/login');
    }
  }
}
