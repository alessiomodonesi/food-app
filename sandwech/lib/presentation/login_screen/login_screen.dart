import 'controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:sandwech/core/app_export.dart';
import 'package:sandwech/core/utils/validation_functions.dart';
import 'package:sandwech/widgets/custom_button.dart';
import 'package:sandwech/widgets/custom_text_form_field.dart';

class LoginScreen extends GetWidget<LoginController> {
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: getPadding(
                        left: 30,
                        top: 22,
                        right: 30,
                      ),
                      child: CommonImageView(
                        svgPath: ImageConstant.imgSignal,
                        height: getVerticalSize(
                          84.00,
                        ),
                        width: getHorizontalSize(
                          53.00,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: getPadding(
                        left: 71,
                        top: 9,
                        right: 71,
                      ),
                      child: CommonImageView(
                        svgPath: ImageConstant.imgGroup,
                        height: getVerticalSize(
                          158.00,
                        ),
                        width: getHorizontalSize(
                          223.00,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: getPadding(
                        left: 24,
                        top: 28,
                        right: 24,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: getVerticalSize(
                              56.00,
                            ),
                            width: getHorizontalSize(
                              23.00,
                            ),
                            margin: getMargin(
                              bottom: 28,
                            ),
                            decoration: BoxDecoration(
                              color: ColorConstant.orange400,
                              borderRadius: BorderRadius.circular(
                                getHorizontalSize(
                                  11.50,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: getVerticalSize(
                              56.00,
                            ),
                            width: getHorizontalSize(
                              23.00,
                            ),
                            margin: getMargin(
                              left: 7,
                              top: 28,
                            ),
                            decoration: BoxDecoration(
                              color: ColorConstant.redA400,
                              borderRadius: BorderRadius.circular(
                                getHorizontalSize(
                                  11.50,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: getPadding(
                        left: 16,
                        top: 7,
                        right: 16,
                      ),
                      child: Text(
                        "lbl_login".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtInterBold36,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: getVerticalSize(
                        2.00,
                      ),
                      width: getHorizontalSize(
                        262.00,
                      ),
                      margin: getMargin(
                        left: 16,
                        top: 4,
                        right: 16,
                      ),
                      decoration: BoxDecoration(
                        color: ColorConstant.bluegray100,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: getHorizontalSize(
                        249.00,
                      ),
                      margin: getMargin(
                        left: 16,
                        top: 13,
                        right: 16,
                      ),
                      child: Text(
                        "msg_uno_non_pu_pensare".tr,
                        maxLines: null,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtInterRegular13,
                      ),
                    ),
                  ),
                  CustomTextFormField(
                    width: 358,
                    focusNode: FocusNode(),
                    controller: controller.emailController,
                    hintText: "msg_mario_rossi_gmail_it".tr,
                    margin: getMargin(
                      left: 16,
                      top: 39,
                      right: 16,
                    ),
                    alignment: Alignment.center,
                    validator: (value) {
                      if (value == null ||
                          (!isValidEmail(value, isRequired: true))) {
                        return "Please enter valid email";
                      }
                      return null;
                    },
                  ),
                  Obx(
                    () => CustomTextFormField(
                      width: 358,
                      focusNode: FocusNode(),
                      controller: controller.passwordController,
                      hintText: "lbl".tr,
                      margin: getMargin(
                        left: 16,
                        top: 13,
                        right: 16,
                      ),
                      textInputAction: TextInputAction.done,
                      alignment: Alignment.center,
                      suffix: InkWell(
                        onTap: () {
                          controller.isShowPassword.value =
                              !controller.isShowPassword.value;
                        },
                        child: Container(
                          margin: getMargin(
                            left: 169,
                            top: 17,
                            right: 20,
                            bottom: 17,
                          ),
                          child: CommonImageView(
                            svgPath: controller.isShowPassword.value
                                ? ImageConstant.imgEye
                                : ImageConstant.imgEye,
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
                          return "Please enter valid password";
                        }
                        return null;
                      },
                      isObscureText: !controller.isShowPassword.value,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: getPadding(
                        left: 16,
                        top: 13,
                        right: 16,
                      ),
                      child: Text(
                        "msg_password_dimenticata".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtInterBold13,
                      ),
                    ),
                  ),
                  CustomButton(
                    width: 261,
                    text: "lbl_accedi".tr,
                    margin: getMargin(
                      left: 16,
                      top: 32,
                      right: 16,
                    ),
                    variant: ButtonVariant.FillOrange400,
                    shape: ButtonShape.CircleBorder30,
                    fontStyle: ButtonFontStyle.InterBold36,
                    alignment: Alignment.center,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: getPadding(
                        left: 16,
                        top: 13,
                        right: 16,
                        bottom: 40,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: getPadding(
                              bottom: 1,
                            ),
                            child: Text(
                              "msg_non_hai_un_account".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterRegular13Gray800,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 6,
                              top: 1,
                            ),
                            child: Text(
                              "lbl_registrati_ora".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterBold13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
