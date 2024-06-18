part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const AUTHENTICATION = _Paths.AUTHENTICATION;
  static const REGISTER = _Paths.REGISTER;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const AUTHENTICATION = '/authentication';
  static const REGISTER = '/register';
}
