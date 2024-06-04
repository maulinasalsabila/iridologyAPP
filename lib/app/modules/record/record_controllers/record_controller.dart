import 'package:get/get.dart';
import 'package:appfinal/app/data/api/medical_record.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MedicalRecordController extends GetxController {
  final MedicalRecordApi recordService;
  MedicalRecordController(this.recordService);

  var medicalRecord = RxMap<dynamic, dynamic>({});

  @override
  void onInit() {
    super.onInit();
    fetchMedicalRecord(); // Panggil fungsi untuk mengambil data rekam medis
  }

  void fetchMedicalRecord() async {
    final response = await recordService.getRecord();
    if (response != 'failed') {
      medicalRecord.addAll(response['data']);
    }
    else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('access_token');
      Get.offAllNamed('/login');
    }
  }
}
