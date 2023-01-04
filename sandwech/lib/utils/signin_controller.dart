import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sandwech/types/user.dart';
import 'package:sandwech/utils/validation.dart';
import 'package:sandwech/utils/endpoints.dart';
import 'package:sandwech/utils/error_dialog.dart';
import 'package:sandwech/utils/utils.dart';
import 'package:sandwech/pages/homepage.dart';

class SignInModel {}

class SignInController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // ignore: non_constant_identifier_names
  Rx<SignInModel> SignInModelObj = SignInModel().obs;

  Rx<bool> isShowPassword = false.obs;

  var passwordHintText = {
    true: "Password",
    false: "••••••••",
  };

  @override
  // ignore: unnecessary_overrides
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

    if (isValidEmail(emailController.text) &&
        passwordController.text.isNotEmpty) {
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
          int idUser = int.parse(jsonDecode(response.toString())["userID"]);
          var userResponse = await Dio().get(getUserUrl + idUser.toString());
          User userData = parseGetUser(jsonEncode(userResponse.data));
          userData.id = idUser;

          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomePage(userData)));
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
