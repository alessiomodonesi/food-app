// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sandwech/utils/size.dart';
import 'package:sandwech/utils/text_form_field.dart';
import 'package:sandwech/utils/signin_controller.dart';
import 'package:get/get.dart';
import 'package:sandwech/pages/signup.dart';

// ignore: must_be_immutable
class SignInPage extends StatefulWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SignInPage({super.key});
  @override
  State<StatefulWidget> createState() => _SignInPageState();
}

final signInController = SignInController();

class _SignInPageState extends State<SignInPage> {
  //String _email;
  //String _password;
  @override
  Widget build(BuildContext conterxt) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
        width: size.width,
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(30, 18, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset("lib/assets/svg/right_side_pills.svg",
                          semanticsLabel: 'Pills'),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("lib/assets/svg/app_logo.svg",
                          semanticsLabel: 'SandWech Logo'),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset("lib/assets/svg/left_side_pills.svg",
                          semanticsLabel: 'Pills'),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(padding: EdgeInsets.fromLTRB(0, 150, 0, 0)),
                      Text(
                          'Uno non può pensare bene, amare bene, \ndormire bene se non ha mangiato bene.',
                          style: TextStyle(
                              fontSize: 14, fontStyle: FontStyle.italic)),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                    child: SizedBox(
                      width: (MediaQuery.of(context).size.width) - 20,
                      child: CustomTextFormField(
                        width: (MediaQuery.of(context).size.width),
                        focusNode: FocusNode(),
                        controller: signInController.emailController,
                        hintText: "Email",
                        margin: getMargin(
                          left: 16,
                          top: 1,
                          right: 16,
                        ),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: (MediaQuery.of(context).size.width) - 20,
                        child: Obx(
                          () => CustomTextFormField(
                            width: 358,
                            focusNode: FocusNode(),
                            controller: signInController.passwordController,
                            hintText: signInController.passwordHintText[
                                signInController.isShowPassword.value],
                            margin: getMargin(
                              left: 16,
                              top: 1,
                              right: 16,
                            ),
                            textInputAction: TextInputAction.done,
                            alignment: Alignment.centerLeft,
                            suffix: InkWell(
                              onTap: () {
                                signInController.isShowPassword.value =
                                    !signInController.isShowPassword.value;
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
                            isObscureText:
                                !signInController.isShowPassword.value,
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
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text('Password dimenticata',
                          style: TextStyle(
                              color: Color.fromARGB(255, 158, 11, 0),
                              fontSize: 14,
                              decoration: TextDecoration.underline)),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: getMargin(
                          left: 0,
                          top: 40,
                          right: 0,
                          bottom: 5,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            signInController.PostSignIn(conterxt);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 158, 11, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Accedi',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        )),
                    /*
                    Container(
                      padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('o',
                              style: TextStyle(
                                color: Color.fromARGB(255, 158, 11, 0),
                                fontSize: 23,
                              )),
                        ],
                      ),
                    ),
                    */
                    SizedBox(
                      width: 70,
                    ),
                    Container(
                        margin: getMargin(
                          left: 0,
                          top: 40,
                          right: 0,
                          bottom: 5,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupScreen()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 158, 11, 0),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
