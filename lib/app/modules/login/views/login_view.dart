import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find();
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFFFF5E4),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: !isKeyboard, // Menyembunyikan logo jika keyboard aktif
              child: Image.asset(
                'assets/images/loginimg.png', // ganti dengan path gambar yang sesuai
                height: 200,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Welcome Back',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            Text('Login to your account'),
            SizedBox(height: 24),
            Container(
              height: 45,
              child: TextField(
                onChanged: (value) => controller.username.value = value,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  fillColor: Colors.white, // Set the background color to white
                  filled: true, // Ensure the fillColor is applied
                ),
              ),
            ),
            SizedBox(height: 16),
            Obx(() => Container(
                  height: 45,
                  child: TextField(
                    onChanged: (value) => controller.password.value = value,
                    obscureText: !controller.isPasswordVisible.value,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                      fillColor:
                          Colors.white, // Set the background color to white
                      filled: true, // Ensure the fillColor is applied
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          controller.isPasswordVisible.value =
                              !controller.isPasswordVisible.value;
                        },
                      ),
                    ),
                  ),
                )),
            SizedBox(height: 20),
            Obx(
              () => controller.isLoading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: controller.login,
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color:
                                Colors.white), // Ubah warna teks menjadi putih
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 145,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        primary: Color(
                            0xFF201658), // Gunakan kode warna heksadesimal
                      ),
                    ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: controller.navigateToRegister,
              child: Text(
                'Belum memiliki akun? Daftar di sini',
                style: TextStyle(color: Color(0xFF1D24CA)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
