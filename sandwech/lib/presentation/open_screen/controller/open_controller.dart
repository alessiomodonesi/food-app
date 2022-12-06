import 'package:sandwech/core/app_export.dart';
import 'package:sandwech/presentation/open_screen/models/open_model.dart';

class OpenController extends GetxController {
  Rx<OpenModel> openModelObj = OpenModel().obs;

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.toNamed(AppRoutes.homeScreen);
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
