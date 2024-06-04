import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../record_controllers/record_controller.dart';

class MedicalRecordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MedicalRecordController controller = Get.find();

    return Scaffold(
        backgroundColor: Color(0xFFF9E8C9),
        appBar: AppBar(
          backgroundColor: Color(0xFF201658),
          title: Text('Medical Record', style: TextStyle(color: Colors.white)),
          iconTheme:
              IconThemeData(color: Colors.white), // Set back button color
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(() {
            if (controller.medicalRecord['history'] != null) {
              var history = controller.medicalRecord['history']!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name: ${controller.medicalRecord['name']}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('Address: ${controller.medicalRecord['address']}'),
                  Text('TTL: ${controller.medicalRecord['ttl']}'),
                  Text('Sex: ${controller.medicalRecord['sex']}'),
                  SizedBox(height: 20),
                  Text(
                    'Medical History:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: history.length,
                      itemBuilder: (context, index) {
                        var date = history.keys.elementAt(index);
                        var diagnosis = history.values.elementAt(index);
                        return ListTile(
                          title: Text('$date: $diagnosis'),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return Text('No medical history available');
            }
          }),
        ));
  }
}
