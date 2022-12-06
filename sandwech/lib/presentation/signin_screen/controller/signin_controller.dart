import 'package:sandwech/core/app_export.dart';
import 'package:sandwech/presentation/signin_screen/models/signin_model.dart';
import 'package:flutter/material.dart';

class SigninController extends GetxController {
  TextEditingController emailController = TextEditingController();

  TextEditingController frameTwoController = TextEditingController();

  Rx<SigninModel> signinModelObj = SigninModel().obs;

  Rx<bool> isShowPassword = false.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    frameTwoController.dispose();
  }
}
