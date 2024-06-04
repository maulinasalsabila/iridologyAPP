import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/register_controller.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.find();
    
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (value) => controller.username.value = value,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              TextField(
                onChanged: (value) => controller.password.value = value,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              TextField(
                onChanged: (value) => controller.name.value = value,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                onChanged: (value) => controller.address.value = value,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              TextField(
                onChanged: (value) => controller.ttl.value = value,
                decoration: InputDecoration(labelText: 'TTL'),
              ),
              TextField(
                onChanged: (value) => controller.sex.value = value,
                decoration: InputDecoration(labelText: 'Gender'),
              ),
              SizedBox(height: 20),
              Obx(() => controller.isLoading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: controller.register,
                      child: Text('Register'),
                    )),
              SizedBox(height: 20),
              GestureDetector(
                onTap: controller.navigateToLogin,
                child: Text(
                  'Sudah memiliki akun? Login di sini',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
