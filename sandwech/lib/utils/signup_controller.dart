//import 'package:sandwech/core/app_export.dart';
import 'package:sandwech/utils/validation.dart';
//import 'package:sandwech/widgets/custom_button.dart';
import 'package:sandwech/utils/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sandwech/utils/size.dart';

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

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text(
                "Impossibile registrarti",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromARGB(255, 158, 11, 0),
                ),
                //style: AppStyle.txtInterBold20,
              ),
              content: const Text(
                'Controlla tutti i campi e poi riprova',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: getMargin(
                          left: 16,
                          top: 10,
                          right: 16,
                          bottom: 5,
                        ),
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 158, 11, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text('Chiudi'),
                        )),
                  ],
                ),
              ],
            ));
  }
}
