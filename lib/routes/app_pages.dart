import 'package:get/get.dart';
import 'package:resumup/bindings/resume_build_bindings.dart';
import 'package:resumup/main.dart';
import 'package:resumup/routes/app_routes.dart';

import '../home_screen.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.home, page: () => HomeScreen(), binding: Resume_Build_Bindings()),
    GetPage(name: AppRoutes.profileBuild, page: () => MyHomePage(),  binding: Resume_Build_Bindings())
  ];
}
