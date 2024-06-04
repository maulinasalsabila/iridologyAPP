import 'package:appfinal/app/data/api/medical_record.dart';
import 'package:get/get.dart';
import '../record_controllers/record_controller.dart';

class MedicalRecordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MedicalRecordApi>(() => MedicalRecordApi());
    Get.lazyPut(() => MedicalRecordController(Get.find<MedicalRecordApi>()));
  }
}
