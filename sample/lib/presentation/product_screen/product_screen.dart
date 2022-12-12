import 'controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:sandwech/core/app_export.dart';
import 'package:sandwech/widgets/custom_button.dart';

class ProductScreen extends GetWidget<ProductController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
                height: size.height,
                width: size.width,
                child: Stack(children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: SingleChildScrollView(
                          child: Container(
                              height: size.height,
                              width: size.width,
                              child: Stack(
                                  alignment: Alignment.bottomLeft,
                                  children: [
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                            height: getVerticalSize(399.00),
                                            width: size.width,
                                            margin: getMargin(bottom: 10),
                                            child: Stack(
                                                alignment: Alignment.topLeft,
                                                children: [
                                                  Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: CommonImageView(
                                                          imagePath:
                                                              ImageConstant
                                                                  .imgImage2,
                                                          height:
                                                              getVerticalSize(
                                                                  399.00),
                                                          width:
                                                              getHorizontalSize(
                                                                  390.00))),
                                                  Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Card(
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          elevation: 0,
                                                          margin: getMargin(
                                                              left: 11,
                                                              top: 39,
                                                              right: 11,
                                                              bottom: 39),
                                                          color: ColorConstant
                                                              .whiteA700,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadiusStyle
                                                                      .roundedBorder15),
                                                          child: Container(
                                                              height: getSize(
                                                                  28.00),
                                                              width: getSize(
                                                                  28.00),
                                                              decoration: AppDecoration
                                                                  .outlineBlack9003f1
                                                                  .copyWith(
                                                                      borderRadius:
                                                                          BorderRadiusStyle
                                                                              .roundedBorder15),
                                                              child: Stack(
                                                                  children: [
                                                                    Align(
                                                                        alignment:
                                                                            Alignment.centerLeft,
                                                                        child: Padding(
                                                                            padding: getPadding(left: 2, top: 3, right: 10, bottom: 3),
                                                                            child: InkWell(
                                                                                onTap: () {
                                                                                  onTapImgArrowleft();
                                                                                },
                                                                                child: CommonImageView(svgPath: ImageConstant.imgArrowleft, height: getSize(22.00), width: getSize(22.00)))))
                                                                  ]))))
                                                ]))),
                                    Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Container(
                                            margin: getMargin(top: 10),
                                            decoration: AppDecoration
                                                .outlineBlack9003f1
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder45),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Padding(
                                                          padding: getPadding(
                                                              left: 11,
                                                              top: 7,
                                                              right: 11),
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                    height:
                                                                        getVerticalSize(
                                                                            47.00),
                                                                    width: getHorizontalSize(
                                                                        186.00),
                                                                    margin: getMargin(
                                                                        top:
                                                                            33),
                                                                    child: Stack(
                                                                        alignment:
                                                                            Alignment.center,
                                                                        children: [
                                                                          Align(
                                                                              alignment: Alignment.bottomLeft,
                                                                              child: Padding(padding: getPadding(top: 10, bottom: 2), child: Text("lbl_toast_1_50".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtInterBold30))),
                                                                          Align(
                                                                              alignment: Alignment.center,
                                                                              child: Container(height: getVerticalSize(47.00), width: getHorizontalSize(2.00), margin: getMargin(left: 40, right: 40), decoration: BoxDecoration(color: ColorConstant.bluegray100)))
                                                                        ])),
                                                                Container(
                                                                    height:
                                                                        getVerticalSize(
                                                                            56.00),
                                                                    width: getHorizontalSize(
                                                                        23.00),
                                                                    margin: getMargin(
                                                                        left:
                                                                            38,
                                                                        bottom:
                                                                            24),
                                                                    decoration: BoxDecoration(
                                                                        color: ColorConstant
                                                                            .orange400,
                                                                        borderRadius:
                                                                            BorderRadius.circular(getHorizontalSize(11.50)))),
                                                                Container(
                                                                    height:
                                                                        getVerticalSize(
                                                                            56.00),
                                                                    width: getHorizontalSize(
                                                                        23.00),
                                                                    margin: getMargin(
                                                                        left: 7,
                                                                        top: 18,
                                                                        bottom:
                                                                            6),
                                                                    decoration: BoxDecoration(
                                                                        color: ColorConstant
                                                                            .redA400,
                                                                        borderRadius:
                                                                            BorderRadius.circular(getHorizontalSize(11.50))))
                                                              ]))),
                                                  Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Container(
                                                          height:
                                                              getVerticalSize(
                                                                  2.00),
                                                          width:
                                                              getHorizontalSize(
                                                                  351.00),
                                                          margin: getMargin(
                                                              left: 11,
                                                              top: 15,
                                                              right: 11),
                                                          decoration: BoxDecoration(
                                                              color: ColorConstant
                                                                  .bluegray100))),
                                                  Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Padding(
                                                          padding: getPadding(
                                                              left: 26,
                                                              top: 9,
                                                              right: 26),
                                                          child: Text(
                                                              "lbl_descrizione"
                                                                  .tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtInterBold19))),
                                                  Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Container(
                                                          width:
                                                              getHorizontalSize(
                                                                  332.00),
                                                          margin: getMargin(
                                                              left: 11,
                                                              top: 13,
                                                              right: 11),
                                                          child: Text(
                                                              "msg_lorem_ipsum_dolor"
                                                                  .tr,
                                                              maxLines: null,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtInterRegular11))),
                                                  Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Padding(
                                                          padding: getPadding(
                                                              left: 26,
                                                              top: 8,
                                                              right: 26),
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                    padding: getPadding(
                                                                        bottom:
                                                                            1),
                                                                    child: Text(
                                                                        "msg_valori_nutrizionali"
                                                                            .tr,
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .left,
                                                                        style: AppStyle
                                                                            .txtInterBold19)),
                                                                Padding(
                                                                    padding: getPadding(
                                                                        left:
                                                                            40,
                                                                        top: 1),
                                                                    child: Text(
                                                                        "lbl_ingredienti"
                                                                            .tr,
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .left,
                                                                        style: AppStyle
                                                                            .txtInterBold19))
                                                              ]))),
                                                  Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Padding(
                                                          padding: getPadding(
                                                              left: 32,
                                                              top: 11,
                                                              right: 32),
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                    width: getHorizontalSize(
                                                                        120.00),
                                                                    child: Text(
                                                                        "msg_energia_kcal_269_energia"
                                                                            .tr,
                                                                        maxLines:
                                                                            null,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .left,
                                                                        style: AppStyle
                                                                            .txtInterRegular13Gray800)),
                                                                Container(
                                                                    width: getHorizontalSize(
                                                                        77.00),
                                                                    margin: getMargin(
                                                                        left:
                                                                            83,
                                                                        top: 1,
                                                                        bottom:
                                                                            2),
                                                                    child: Text(
                                                                        "msg_pane_uova_formaggio_carne"
                                                                            .tr,
                                                                        maxLines:
                                                                            null,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .left,
                                                                        style: AppStyle
                                                                            .txtInterRegular13Gray800))
                                                              ]))),
                                                  Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Container(
                                                          margin: getMargin(
                                                              left: 11,
                                                              top: 22,
                                                              right: 11,
                                                              bottom: 171),
                                                          decoration: AppDecoration
                                                              .outlineYellow900bc
                                                              .copyWith(
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .circleBorder30),
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                    margin: getMargin(
                                                                        top: 15,
                                                                        bottom:
                                                                            14),
                                                                    decoration: AppDecoration
                                                                        .outlineWhiteA700
                                                                        .copyWith(
                                                                            borderRadius: BorderRadiusStyle
                                                                                .roundedBorder15),
                                                                    child: Row(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .center,
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        children: [
                                                                          Padding(
                                                                              padding: getPadding(left: 9, top: 6, bottom: 6),
                                                                              child: CommonImageView(svgPath: ImageConstant.imgCar, height: getSize(19.00), width: getSize(19.00))),
                                                                          Padding(
                                                                              padding: getPadding(left: 17, top: 1, bottom: 1),
                                                                              child: Text("lbl_1".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtInterBold23)),
                                                                          Padding(
                                                                              padding: getPadding(left: 18, top: 6, right: 9, bottom: 6),
                                                                              child: CommonImageView(svgPath: ImageConstant.imgPlus, height: getSize(19.00), width: getSize(19.00)))
                                                                        ])),
                                                                Card(
                                                                    clipBehavior:
                                                                        Clip
                                                                            .antiAlias,
                                                                    elevation:
                                                                        0,
                                                                    margin: getMargin(
                                                                        left:
                                                                            71,
                                                                        top: 12,
                                                                        bottom:
                                                                            11),
                                                                    color: ColorConstant
                                                                        .whiteA700,
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadiusStyle.roundedBorder18),
                                                                    child: Container(
                                                                        height: getSize(37.00),
                                                                        width: getSize(37.00),
                                                                        decoration: AppDecoration.fillWhiteA700.copyWith(borderRadius: BorderRadiusStyle.roundedBorder18),
                                                                        child: Stack(children: [
                                                                          Align(
                                                                              alignment: Alignment.bottomCenter,
                                                                              child: Padding(padding: getPadding(left: 2, top: 10, right: 2), child: CommonImageView(imagePath: ImageConstant.imgCarticon2, height: getVerticalSize(35.00), width: getHorizontalSize(33.00))))
                                                                        ])))
                                                              ])))
                                                ]))),
                                    CustomButton(
                                        width: 71,
                                        text: "lbl_4_5".tr,
                                        margin: getMargin(
                                            left: 45,
                                            top: 322,
                                            right: 45,
                                            bottom: 322),
                                        variant:
                                            ButtonVariant.OutlineBlack9003f,
                                        shape: ButtonShape.RoundedBorder21,
                                        fontStyle: ButtonFontStyle.InterBold17,
                                        alignment: Alignment.topLeft),
                                    Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Container(
                                            margin: getMargin(top: 10),
                                            decoration: AppDecoration
                                                .outlineGray200
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .circleBorder30),
                                            child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                      padding: getPadding(
                                                          left: 46,
                                                          top: 23,
                                                          bottom: 276),
                                                      child: CommonImageView(
                                                          svgPath: ImageConstant
                                                              .imgUser,
                                                          height:
                                                              getSize(38.00),
                                                          width:
                                                              getSize(38.00))),
                                                  Padding(
                                                      padding: getPadding(
                                                          left: 91,
                                                          top: 23,
                                                          bottom: 276),
                                                      child: CommonImageView(
                                                          imagePath:
                                                              ImageConstant
                                                                  .imgHome1,
                                                          height:
                                                              getSize(39.00),
                                                          width:
                                                              getSize(39.00))),
                                                  Padding(
                                                      padding: getPadding(
                                                          left: 89,
                                                          top: 18,
                                                          right: 36,
                                                          bottom: 273),
                                                      child: CommonImageView(
                                                          imagePath:
                                                              ImageConstant
                                                                  .imgCart1,
                                                          height:
                                                              getVerticalSize(
                                                                  47.00),
                                                          width:
                                                              getHorizontalSize(
                                                                  50.00)))
                                                ])))
                                  ]))))
                ]))));
  }

  onTapImgArrowleft() {
    Get.back();
  }
}
