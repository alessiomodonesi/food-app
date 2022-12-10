import 'controller/open_controller.dart';
import 'package:flutter/material.dart';
import 'package:sandwech/core/app_export.dart';

class OpenScreen extends GetWidget<OpenController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
                width: size.width,
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding:
                                  getPadding(left: 71, top: 115, right: 71),
                              child: CommonImageView(
                                  svgPath: ImageConstant.imgGroup,
                                  height: getVerticalSize(158.00),
                                  width: getHorizontalSize(223.00)))),
                      Padding(
                          padding: getPadding(
                              left: 71, top: 103, right: 71, bottom: 5),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  getHorizontalSize(97.50)),
                              child: CommonImageView(
                                  imagePath: ImageConstant.imgLoading1,
                                  height: getSize(195.00),
                                  width: getSize(195.00),
                                  fit: BoxFit.cover)))
                    ])))));
  }
}
