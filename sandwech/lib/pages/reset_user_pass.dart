// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sandwech/utils/size.dart';
import 'package:sandwech/utils/text_form_field.dart';
import 'package:sandwech/utils/reser_pass_controller.dart';

// ignore: must_be_immutable
class ReserUserPasswordPage extends StatefulWidget {
  // ignore: unused_field
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ReserUserPasswordPage({super.key});
  @override
  State<StatefulWidget> createState() => _ReserUserPasswordPageState();
}

final reserPassController = ReserPassController();

class _ReserUserPasswordPageState extends State<ReserUserPasswordPage> {
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
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: SizedBox(
                      width: (MediaQuery.of(context).size.width) - 20,
                      child: CustomTextFormField(
                        width: (MediaQuery.of(context).size.width),
                        focusNode: FocusNode(),
                        controller: reserPassController.emailController,
                        hintText: "Inserisci email",
                        margin: getMargin(
                          left: 16,
                          top: 1,
                          right: 16,
                        ),
                      ),
                    )),
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
                            reserPassController.PostResetPassword(conterxt);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 158, 11, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Conferma',
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
