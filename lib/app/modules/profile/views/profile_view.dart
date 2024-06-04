import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => TextField(
                  onChanged: (value) =>
                      controller.updateField('password', value),
                  enabled: controller.isEditing.value,
                  decoration: InputDecoration(labelText: 'Password'),
                  controller: TextEditingController.fromValue(TextEditingValue(
                    text: controller.password.value,
                    selection: TextSelection.collapsed(
                        offset: controller.password.value.length),
                  )),
                )),
            Obx(() => TextField(
                  onChanged: (value) => controller.updateField('name', value),
                  enabled: controller.isEditing.value,
                  decoration: InputDecoration(labelText: 'Name'),
                  controller: TextEditingController.fromValue(TextEditingValue(
                    text: controller.name.value,
                    selection: TextSelection.collapsed(
                        offset: controller.name.value.length),
                  )),
                )),
            Obx(() => TextField(
                  onChanged: (value) =>
                      controller.updateField('address', value),
                  enabled: controller.isEditing.value,
                  decoration: InputDecoration(labelText: 'Address'),
                  controller: TextEditingController.fromValue(TextEditingValue(
                    text: controller.address.value,
                    selection: TextSelection.collapsed(
                        offset: controller.address.value.length),
                  )),
                )),
            Obx(() => TextField(
                  onChanged: (value) => controller.updateField('ttl', value),
                  enabled: controller.isEditing.value,
                  decoration: InputDecoration(labelText: 'TTL'),
                  controller: TextEditingController.fromValue(TextEditingValue(
                    text: controller.ttl.value,
                    selection: TextSelection.collapsed(
                        offset: controller.ttl.value.length),
                  )),
                )),
            Obx(() => TextField(
                  onChanged: (value) => controller.updateField('sex', value),
                  enabled: controller.isEditing.value,
                  decoration: InputDecoration(labelText: 'Sex'),
                  controller: TextEditingController.fromValue(TextEditingValue(
                    text: controller.sex.value,
                    selection: TextSelection.collapsed(
                        offset: controller.sex.value.length),
                  )),
                )),
            Obx(() => TextField(
                  onChanged: (value) =>
                      controller.updateField('username', value),
                  enabled: controller.isEditing.value,
                  decoration: InputDecoration(labelText: 'Username'),
                  controller: TextEditingController.fromValue(TextEditingValue(
                    text: controller.username.value,
                    selection: TextSelection.collapsed(
                        offset: controller.username.value.length),
                  )),
                )),
            SizedBox(height: 20),
            Center(
              child: Obx(() => ElevatedButton(
                    onPressed: controller.isEditing.value
                        ? (controller.isModified.value
                            ? controller.saveProfile
                            : controller.toggleEditMode)
                        : controller.toggleEditMode,
                    child: Text(controller.isEditing.value
                        ? (controller.isModified.value ? 'Save' : 'Cancel')
                        : 'Edit'),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
