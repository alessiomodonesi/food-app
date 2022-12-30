import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:sandwech/pages/signin.dart';

import 'package:sandwech/utils/validation.dart';
import 'package:sandwech/utils/endpoints.dart';
import 'package:sandwech/utils/error_dialog.dart';

class ReserPassModel {}

class ReserPassController extends GetxController {
  TextEditingController emailController = TextEditingController();

  // ignore: non_constant_identifier_names
  Rx<ReserPassModel> ReserPassModelObj = ReserPassModel().obs;

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
  }

  // ignore: non_constant_identifier_names
  void PostResetPassword(context) async {
    var dio = Dio();

    if (isValidEmail(emailController.text)) {
      try {
        var response = await dio.post(resetPassword,
            data: {'email': emailController.text},
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
          print(json.encode(response));
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignInPage()));
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
