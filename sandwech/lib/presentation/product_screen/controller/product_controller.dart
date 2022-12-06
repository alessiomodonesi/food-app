import 'package:sandwech/core/app_export.dart';
import 'package:sandwech/presentation/product_screen/models/product_model.dart';

class ProductController extends GetxController {
  Rx<ProductModel> productModelObj = ProductModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
