import '../cart_screen/widgets/list837403151_item_widget.dart';
import 'controller/cart_controller.dart';
import 'models/list837403151_item_model.dart';
import 'package:flutter/material.dart';
import 'package:sandwech/core/app_export.dart';
import 'package:sandwech/widgets/app_bar/appbar_title.dart';
import 'package:sandwech/widgets/app_bar/custom_app_bar.dart';
import 'package:sandwech/widgets/custom_button.dart';

class CartScreen extends GetWidget<CartController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: CustomAppBar(
                height: getVerticalSize(56.00),
                leadingWidth: 39,
                leading: Container(
                    margin: getMargin(left: 11, top: 14, bottom: 13),
                    decoration: AppDecoration.outlineBlack9003f1.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder15),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: getPadding(
                                      left: 1, top: 2, right: 4, bottom: 3),
                                  child: InkWell(
                                      onTap: () {
                                        onTapImgArrowleft();
                                      },
                                      child: CommonImageView(
                                          svgPath: ImageConstant.imgArrowleft,
                                          height: getSize(22.00),
                                          width: getSize(22.00)))))
                        ])),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_il_mio_carrello".tr)),
            body: SingleChildScrollView(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                  Align(
                      alignment: Alignment.center,
                      child: Container(
                          height: getVerticalSize(2.00),
                          width: getHorizontalSize(352.00),
                          margin: getMargin(left: 19, right: 19),
                          decoration: BoxDecoration(
                              color: ColorConstant.bluegray100,
                              borderRadius: BorderRadius.circular(
                                  getHorizontalSize(1.00))))),
                  Align(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: getPadding(left: 19, top: 19, right: 6),
                          child: Obx(() => ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.cartModelObj.value
                                  .list837403151ItemList.length,
                              itemBuilder: (context, index) {
                                List837403151ItemModel model = controller
                                    .cartModelObj
                                    .value
                                    .list837403151ItemList[index];
                                return List837403151ItemWidget(model);
                              })))),
                  Container(
                      width: double.infinity,
                      margin: getMargin(top: 39),
                      decoration: AppDecoration.outlineBlack9003f2.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder54),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                                padding:
                                    getPadding(left: 16, top: 33, right: 16),
                                child: Text("lbl_totale".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtInterBold30WhiteA700)),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    height: getVerticalSize(2.00),
                                    width: getHorizontalSize(352.00),
                                    margin:
                                        getMargin(left: 16, top: 1, right: 16),
                                    decoration: BoxDecoration(
                                        color: ColorConstant.bluegray100,
                                        borderRadius: BorderRadius.circular(
                                            getHorizontalSize(1.00))))),
                            Align(
                                alignment: Alignment.center,
                                child: Padding(
                                    padding:
                                        getPadding(left: 16, top: 3, right: 16),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                              padding: getPadding(bottom: 1),
                                              child: Text("lbl_prezzo".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtInterBold30WhiteA700)),
                                          Padding(
                                              padding: getPadding(top: 1),
                                              child: Text("lbl_1_502".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtInterBold30WhiteA700))
                                        ]))),
                            CustomButton(
                                width: 338,
                                text: "lbl_conferma".tr,
                                margin: getMargin(
                                    left: 16, top: 35, right: 16, bottom: 5),
                                variant:
                                    ButtonVariant.OutlineDeeporangeA700bc_1,
                                shape: ButtonShape.CircleBorder30,
                                fontStyle: ButtonFontStyle.InterBold35,
                                alignment: Alignment.center)
                          ]))
                ]))));
  }

  onTapImgArrowleft() {
    Get.back();
  }
}
