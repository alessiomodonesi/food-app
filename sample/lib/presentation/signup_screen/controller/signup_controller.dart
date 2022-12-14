import 'package:sandwech/core/app_export.dart';
import 'package:sandwech/core/utils/validation_functions.dart';
import 'package:sandwech/presentation/signup_screen/models/signup_model.dart';
import 'package:sandwech/core/utils/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Rx<SignupModel> SignupModelObj = SignupModel().obs;

  Rx<bool> isShowPassword = false.obs;
  Rx<bool> isShowPasswordConfirm = false.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    surnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  void PostSignUp() async {
    var dio = Dio();

    if (nameController.text != null &&
        nameController.text != '' &&
        surnameController.text != null &&
        nameController.text != '' &&
        emailController.text != null &&
        isValidEmail(emailController.text) &&
        passwordController.text != null &&
        isValidPassword(passwordController.text) &&
        confirmPasswordController.text == passwordController.text) {
      await dio.post(postSignUpUrl, data: {
        'name': nameController.text,
        'surname': surnameController.text,
        'email': emailController.text,
        'password': passwordController.text
      });
    }
  }
}
