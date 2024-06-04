part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASHSCREEN = _Paths.SPLASHSCREEN;
  static const HOME = _Paths.HOME;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const PROFILE = _Paths.PROFILE;
  static const RECORD = _Paths.RECORD;
  static const CLASSIFICATION = _Paths.CLASSIFICATION;
}

abstract class _Paths {
  _Paths._();
  static const SPLASHSCREEN = '/';
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const PROFILE = '/profile';
  static const RECORD = '/record';
  static const CLASSIFICATION = '/classification';
}
