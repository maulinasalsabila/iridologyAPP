import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';

import '../modules/register/views/register_view.dart';
import '../modules/register/bindings/register_binding.dart';

import '../modules/splashscreen/views/splashscreen_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';

import '../modules/profile/views/profile_view.dart';
import '../modules/profile/bindings/profile_binding.dart';

import 'package:appfinal/app/modules/record/record_bindings/record_binding.dart';
import 'package:appfinal/app/modules/record/record_views/record_view.dart';

import 'package:appfinal/app/modules/classification/classification_bindings/classification_binding.dart';
import 'package:appfinal/app/modules/classification/classification_views/classification_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.RECORD,
      page: () => MedicalRecordView(),
      binding: MedicalRecordBinding(),
    ),
    GetPage(
      name: _Paths.CLASSIFICATION,
      page: () => ClassificationView(),
      binding: ClassificationBinding(),
    ),
  ];
}
