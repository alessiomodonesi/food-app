import 'dart:convert';

import 'package:sandwech/utils/validation.dart';
import 'package:sandwech/utils/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sandwech/utils/error_dialog.dart';
import 'package:sandwech/pages/homepage.dart';

class SignInModel {}

class SignInController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Rx<SignInModel> SignInModelObj = SignInModel().obs;

  Rx<bool> isShowPassword = false.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  // ignore: non_constant_identifier_names
  void PostSignIn(context) async {
    var dio = Dio();

    if (emailController.text != null &&
        isValidEmail(emailController.text) &&
        passwordController.text != null &&
        !passwordController.text.isEmpty) {
      try {
        var response = await dio.post(postSignInUrl,
            data: {
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
              },
            ));
        if (response.statusCode == 200) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage(
                      int.parse(jsonDecode(response.toString())["user"]))));
          return;
        }
        if (response.statusCode == 401) {
          showDialogError(
              context, 'Impossibile accedere', 'Email o password errati');
          return;
        }
      } catch (e) {
        showDialogError(context, 'Impossibile accedere',
            'Impossibile contattare il server. Controlla la connessione e riprova.');
        return;
      }
    } else {
      showDialogError(
          context, 'Impossibile accedere', 'Tutti i campi sono obbligatori');
      return;
    }
  }
}
