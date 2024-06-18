part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const AUTHENTICATION = _Paths.AUTHENTICATION;
  static const REGISTER = _Paths.REGISTER;
  static const PELATIHAN = _Paths.PELATIHAN;
  static const CONTENT = _Paths.CONTENT;
  static const PERMAINAN = _Paths.PERMAINAN;
  static const SEJARAH = _Paths.SEJARAH;
  static const PROGRESS = _Paths.PROGRESS;
  static const DETAIL_PELATIHAN = _Paths.DETAIL_PELATIHAN;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const AUTHENTICATION = '/authentication';
  static const REGISTER = '/register';
  static const PELATIHAN = '/pelatihan';
  static const CONTENT = '/content';
  static const PERMAINAN = '/permainan';
  static const SEJARAH = '/sejarah';
  static const PROGRESS = '/progress';
  static const DETAIL_PELATIHAN = '/detail-pelatihan';
}
