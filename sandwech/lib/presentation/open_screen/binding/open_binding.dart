import '../controller/open_controller.dart';
import 'package:get/get.dart';

class OpenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OpenController());
  }
}
