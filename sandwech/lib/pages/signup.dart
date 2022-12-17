import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sandwech/utils/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:sandwech/utils/validation.dart';
import 'package:get/get.dart';
import 'package:sandwech/utils/colors.dart';
import 'package:sandwech/utils/size.dart';

class SignupScreen extends GetWidget<SignupController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: Container(
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
                        margin: getMargin(
                          right: 30,
                        ),
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
                          left: 16,
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
                      top: 1,
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
                        width: (MediaQuery.of(context).size.width) - 40,
                        child: TextField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(20.0),
                                hintText: "Mario",
                                filled: true,
                                fillColor: Color.fromARGB(255, 239, 237, 237),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    width: 0,
                                    color: Color.fromARGB(255, 239, 237, 237),
                                  ),
                                ))),
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
                        width: (MediaQuery.of(context).size.width) - 40,
                        child: TextField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(20.0),
                                hintText: "Rossi",
                                filled: true,
                                fillColor: Color.fromARGB(255, 239, 237, 237),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    width: 0,
                                    color: Color.fromARGB(255, 239, 237, 237),
                                  ),
                                ))),
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
                        width: (MediaQuery.of(context).size.width) - 40,
                        child: TextField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(20.0),
                                hintText: "mario.rossi@gmail.com",
                                filled: true,
                                fillColor: Color.fromARGB(255, 239, 237, 237),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    width: 0,
                                    color: Color.fromARGB(255, 239, 237, 237),
                                  ),
                                ))),
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
                          child: TextField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(20.0),
                                  hintText: "Password",
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 239, 237, 237),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                      width: 0,
                                      color: Color.fromARGB(255, 239, 237, 237),
                                    ),
                                  ))),
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
                          child: TextField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(20.0),
                                  hintText: "Password",
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 239, 237, 237),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                      width: 0,
                                      color: Color.fromARGB(255, 239, 237, 237),
                                    ),
                                  ))),
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
                                9,
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
                                9,
                              ),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: ".",
                            style: TextStyle(
                              color: ColorConstant.gray800,
                              fontSize: getFontSize(
                                9,
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
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Registrati'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 158, 11, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      margin: getMargin(
                        left: 16,
                        top: 40,
                        right: 16,
                        bottom: 5,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
