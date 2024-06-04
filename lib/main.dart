import 'package:flutter/material.dart';

import 'package:get/get.dart';

// import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // loadEnv();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
