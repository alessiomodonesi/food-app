//import 'package:sandwech/core/app_export.dart';
import 'package:sandwech/utils/validation.dart';
//import 'package:sandwech/widgets/custom_button.dart';
import 'package:sandwech/utils/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class SignupModel {}

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

  void PostSignUp(context) async {
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
      return;
    }

    // showDialog(
    //     context: context,
    //     builder: (context) => AlertDialog(
    //           title: Text(
    //             'Impossibile registrarsi',
    //             style: AppStyle.txtInterBold20RedA400,
    //             textAlign: TextAlign.center,
    //           ),
    //           content: Text(
    //             'Controlla tutti i campi e poi riprova',
    //             style: AppStyle.txtInterRegular16,
    //             textAlign: TextAlign.center,
    //           ),
    //           shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(15),
    //           ),
    //           actions: [
    //             CustomButton(
    //               onTap: () => Get.back(),
    //               width: 220,
    //               text: "Chiudi",
    //               margin: getMargin(
    //                 left: 16,
    //                 top: 5,
    //                 right: 16,
    //                 bottom: 5,
    //               ),
    //               variant: ButtonVariant.FillRedA400,
    //               shape: ButtonShape.CircleBorder30,
    //               fontStyle: ButtonFontStyle.InterBold16,
    //             ),
    //           ],
    //         ));
  }
}
