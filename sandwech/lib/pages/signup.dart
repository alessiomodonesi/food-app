import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sandwech/utils/signup_controller.dart';
import 'package:sandwech/utils/validation.dart';
import 'package:get/get.dart';
import 'package:sandwech/utils/colors.dart';
import 'package:sandwech/utils/size.dart';
import 'package:sandwech/utils/text_form_field.dart';

class SignupScreen extends GetWidget<SignUpController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final signUpController = SignUpController();

  // final nameController = SignupController().nameController;
  // final surnameController = SignupController().surnameController;
  // final emailController = SignupController().emailController;
  // final passwordController = SignupController().passwordController;
  // final confirmPasswordController =
  //     SignupController().confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      body: Container(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        width: size.width,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  //* Pills
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(30, 18, 30, 0),
                      child: SvgPicture.asset(
                          "lib/assets/svg/right_side_pills.svg",
                          semanticsLabel: 'Pills'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: getMargin(
                        left: 18,
                        top: 1,
                        right: 16,
                      ),
                      child: const Text(
                        "Crea il tuo account",
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  height: getVerticalSize(
                    2.00,
                  ),
                  width: getHorizontalSize(
                    352.00,
                  ),
                  margin: getMargin(
                    left: 16,
                    top: 10,
                    right: 16,
                  ),
                  decoration: BoxDecoration(
                    color: ColorConstant.bluegray100,
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(
                        1.00,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: getPadding(
                      left: 25,
                      top: 25,
                      right: 25,
                    ),
                    child: const Text(
                      "Nome",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color.fromARGB(255, 158, 11, 0),
                      ),
                      //style: AppStyle.txtInterBold20,
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: SizedBox(
                      child: CustomTextFormField(
                        width: 358,
                        focusNode: FocusNode(),
                        controller: signUpController.nameController,
                        hintText: "Nome",
                        margin: getMargin(
                          left: 16,
                          top: 1,
                          right: 16,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Il nome è obbligatorio";
                          }
                          return null;
                        },
                      ),
                    )),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: getPadding(
                      left: 25,
                      top: 25,
                      right: 25,
                    ),
                    child: const Text(
                      "Cognome",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color.fromARGB(255, 158, 11, 0),
                      ),
                      //style: AppStyle.txtInterBold20,
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: SizedBox(
                      width: (MediaQuery.of(context).size.width),
                      child: CustomTextFormField(
                        width: 358,
                        focusNode: FocusNode(),
                        controller: signUpController.surnameController,
                        hintText: "Cognome",
                        margin: getMargin(
                          left: 16,
                          top: 1,
                          right: 16,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Il cognome è obbligatorio";
                          }
                          return null;
                        },
                      ),
                    )),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: getPadding(
                      left: 25,
                      top: 25,
                      right: 25,
                    ),
                    child: const Text(
                      "Email",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color.fromARGB(255, 158, 11, 0),
                      ),
                      //style: AppStyle.txtInterBold20,
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: SizedBox(
                      width: (MediaQuery.of(context).size.width),
                      child: CustomTextFormField(
                        width: 358,
                        focusNode: FocusNode(),
                        controller: signUpController.emailController,
                        hintText: "Email",
                        margin: getMargin(
                          left: 16,
                          top: 1,
                          right: 16,
                        ),
                        validator: (value) {
                          if (value == null ||
                              (!isValidEmail(value, isRequired: true))) {
                            return "Questa non è un email valida";
                          }
                          return null;
                        },
                      ),
                    )),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: getPadding(
                      left: 25,
                      top: 25,
                      right: 25,
                    ),
                    child: const Text(
                      "Password",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color.fromARGB(255, 158, 11, 0),
                      ),
                      //style: AppStyle.txtInterBold20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: (MediaQuery.of(context).size.width) - 40,
                        child: Obx(
                          () => CustomTextFormField(
                            width: 358,
                            focusNode: FocusNode(),
                            controller: signUpController.passwordController,
                            hintText: signUpController.passwordHintText[
                                signUpController.isShowPassword.value],
                            textInputAction: TextInputAction.done,
                            alignment: Alignment.centerLeft,
                            suffix: InkWell(
                              onTap: () {
                                signUpController.isShowPassword.value =
                                    !signUpController.isShowPassword.value;
                              },
                              child: Container(
                                margin: getMargin(
                                  left: 169,
                                  top: 17,
                                  right: 20,
                                  bottom: 17,
                                ),
                                child: SvgPicture.asset(
                                  "lib/assets/svg/img_eye.svg",
                                  semanticsLabel: 'Pills',
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                            ),
                            suffixConstraints: BoxConstraints(
                              minWidth: getHorizontalSize(
                                22.00,
                              ),
                              minHeight: getVerticalSize(
                                22.00,
                              ),
                            ),
                            validator: (value) {
                              if (value == null ||
                                  (!isValidPassword(value, isRequired: true))) {
                                return "Questa password non è valida";
                              }
                              return null;
                            },
                            isObscureText:
                                !signUpController.isShowPassword.value,
                          ),
                        ),
                      ),
                      // SvgPicture.asset(
                      //   "lib/assets/svg/eye.svg",
                      //   semanticsLabel: 'Pills',
                      //   width: 20,
                      //   height: 20,
                      // ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: getPadding(
                      left: 25,
                      top: 25,
                      right: 25,
                    ),
                    child: const Text(
                      "Conferma Password",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color.fromARGB(255, 158, 11, 0),
                      ),
                      //style: AppStyle.txtInterBold20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: (MediaQuery.of(context).size.width) - 40,
                        child: Obx(
                          () => CustomTextFormField(
                            width: 358,
                            focusNode: FocusNode(),
                            controller:
                                signUpController.confirmPasswordController,
                            hintText: signUpController.passwordHintText[
                                signUpController.isShowPasswordConfirm.value],
                            textInputAction: TextInputAction.done,
                            alignment: Alignment.centerLeft,
                            suffix: InkWell(
                              onTap: () {
                                signUpController.isShowPasswordConfirm.value =
                                    !signUpController
                                        .isShowPasswordConfirm.value;
                              },
                              child: Container(
                                margin: getMargin(
                                  left: 169,
                                  top: 17,
                                  right: 20,
                                  bottom: 17,
                                ),
                                child: SvgPicture.asset(
                                  "lib/assets/svg/img_eye.svg",
                                  semanticsLabel: 'Pills',
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                            ),
                            suffixConstraints: BoxConstraints(
                              minWidth: getHorizontalSize(
                                22.00,
                              ),
                              minHeight: getVerticalSize(
                                22.00,
                              ),
                            ),
                            validator: (value) {
                              if (value == null ||
                                  (value !=
                                      signUpController
                                          .passwordController.text)) {
                                return "La password non corrisponde a quella precedente";
                              }
                              return null;
                            },
                            isObscureText:
                                !signUpController.isShowPassword.value,
                          ),
                        ),
                      ),
                      // SvgPicture.asset(
                      //   "lib/assets/svg/eye.svg",
                      //   semanticsLabel: 'Pills',
                      //   width: 20,
                      //   height: 20,
                      // ),
                    ],
                  ),
                ),
                Container(
                  margin: getMargin(
                    left: 16,
                    top: 13,
                    right: 16,
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              'Cliccando sul tasto "Registrati", confermi di aver accettato i nostri ',
                          style: TextStyle(
                            color: ColorConstant.gray800,
                            fontSize: getFontSize(
                              9.6,
                            ),
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: "Termini di servizio",
                          style: TextStyle(
                            color: ColorConstant.orange400,
                            fontSize: getFontSize(
                              9.6,
                            ),
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                    margin: getMargin(
                      left: 16,
                      top: 40,
                      right: 16,
                      bottom: 5,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        signUpController.PostSignUp(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 158, 11, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Registrati',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
