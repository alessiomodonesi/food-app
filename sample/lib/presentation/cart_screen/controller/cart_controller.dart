import 'package:sandwech/core/app_export.dart';
import 'package:sandwech/presentation/cart_screen/models/cart_model.dart';

class CartController extends GetxController {
  Rx<CartModel> cartModelObj = CartModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
