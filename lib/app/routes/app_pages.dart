import 'package:get/get.dart';

import '../modules/authentication/bindings/authentication_binding.dart';
import '../modules/authentication/views/authentication_view.dart';
import '../modules/content/bindings/content_binding.dart';
import '../modules/content/views/content_view.dart';
import '../modules/detail_pelatihan/bindings/detail_pelatihan_binding.dart';
import '../modules/detail_pelatihan/views/detail_pelatihan_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/pelatihan/bindings/pelatihan_binding.dart';
import '../modules/pelatihan/views/pelatihan_view.dart';
import '../modules/permainan/bindings/permainan_binding.dart';
import '../modules/permainan/views/permainan_view.dart';
import '../modules/progress/bindings/progress_binding.dart';
import '../modules/progress/views/progress_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/sejarah/bindings/sejarah_binding.dart';
import '../modules/sejarah/views/sejarah_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTHENTICATION;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTHENTICATION,
      page: () => const AuthenticationView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.PELATIHAN,
      page: () => const PelatihanView(),
      binding: PelatihanBinding(),
    ),
    GetPage(
      name: _Paths.CONTENT,
      page: () => const ContentView(),
      binding: ContentBinding(),
    ),
    GetPage(
      name: _Paths.PERMAINAN,
      page: () => const PermainanView(),
      binding: PermainanBinding(),
    ),
    GetPage(
      name: _Paths.SEJARAH,
      page: () => const SejarahView(),
      binding: SejarahBinding(),
    ),
    GetPage(
      name: _Paths.PROGRESS,
      page: () => const ProgressView(),
      binding: ProgressBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PELATIHAN,
      page: () => const DetailPelatihanView(),
      binding: DetailPelatihanBinding(),
    ),
  ];
}
