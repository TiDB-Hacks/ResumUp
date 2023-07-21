import 'package:get/get.dart';

import '../controller/resume_build_controller.dart';

class Resume_Build_Bindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResumeBuildController());
  }
}
