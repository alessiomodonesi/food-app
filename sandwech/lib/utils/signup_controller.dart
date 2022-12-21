import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

import 'package:sandwech/utils/validation.dart';
import 'package:sandwech/utils/endpoints.dart';
import 'package:sandwech/utils/error_dialog.dart';
import 'package:sandwech/utils/utils.dart';
import 'package:sandwech/pages/homepage.dart';
import 'package:sandwech/types/user.dart';

class SignUpModel {}

class SignUpController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Rx<SignUpModel> SignUpModelObj = SignUpModel().obs;

  Rx<bool> isShowPassword = false.obs;
  Rx<bool> isShowPasswordConfirm = false.obs;

  var passwordHintText = {
    true: "Password",
    false: "••••••••",
  };

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

    if (nameController.text != '' &&
        nameController.text != '' &&
        isValidEmail(emailController.text) &&
        isValidPassword(passwordController.text) &&
        confirmPasswordController.text == passwordController.text) {
      try {
        var response = await dio.post(postSignUpUrl,
            data: {
              'name': nameController.text,
              'surname': surnameController.text,
              'email': emailController.text,
              'password': passwordController.text
            },
            options: Options(
                headers: {
                  'Content-Type': 'application/json',
                  'Accept': 'application/json',
                },
                validateStatus: (status) {
                  return status! < 500;
                }));
        if (response.statusCode == 200) {
          int idUser = int.parse(jsonDecode(response.toString())["userID"]);
          var userResponse = await Dio().get(getUserUrl + idUser.toString());
          User userData = parseGetUser(jsonEncode(userResponse.data));
          userData.id = idUser;

          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomePage(userData)));
          return;
        } else {
          showDialogError(context, 'Impossibile registrarsi',
              'Controlla tutti i campi e poi riprova');
          return;
        }
      } catch (e) {
        showDialogError(context, 'Impossibile registrarsi',
            'Impossibile contattare il server. Controlla la connessione e riprova.');
        return;
      }
    } else {
      showDialogError(context, 'Impossibile registrarsi',
          'Compila tutti i campi correttamente');
      return;
    }
  }
}
