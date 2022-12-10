import '../home_screen/widgets/list837403151_four_item_widget.dart';
import '../home_screen/widgets/list837403151_one_item_widget.dart';
import 'controller/home_controller.dart';
import 'models/list837403151_four_item_model.dart';
import 'models/list837403151_one_item_model.dart';
import 'package:flutter/material.dart';
import 'package:sandwech/core/app_export.dart';
import 'package:sandwech/widgets/custom_button.dart';
import 'package:sandwech/widgets/custom_search_view.dart';

class HomeScreen extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: getPadding(
                            left: 5,
                            right: 10,
                          ),
                          child: CommonImageView(
                            imagePath: ImageConstant.imgSignalRedA400,
                            height: getVerticalSize(
                              43.00,
                            ),
                            width: getHorizontalSize(
                              53.00,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: getMargin(
                            left: 24,
                            top: 17,
                            right: 24,
                          ),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "lbl_ciao".tr,
                                  style: TextStyle(
                                    color: ColorConstant.black900,
                                    fontSize: getFontSize(
                                      20,
                                    ),
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: "lbl_alessio".tr,
                                  style: TextStyle(
                                    color: ColorConstant.black900,
                                    fontSize: getFontSize(
                                      20,
                                    ),
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      CustomSearchView(
                        width: 330,
                        focusNode: FocusNode(),
                        controller: controller.boxCercaController,
                        hintText: "msg_cerca_qualcosa".tr,
                        margin: getMargin(
                          left: 14,
                          top: 40,
                          right: 14,
                        ),
                        alignment: Alignment.center,
                        prefix: Container(
                          margin: getMargin(
                            left: 22,
                            top: 10,
                            right: 7,
                            bottom: 11,
                          ),
                          child: CommonImageView(
                            svgPath: ImageConstant.imgSearch,
                          ),
                        ),
                        prefixConstraints: BoxConstraints(
                          minWidth: getSize(
                            18.00,
                          ),
                          minHeight: getSize(
                            18.00,
                          ),
                        ),
                        suffix: Padding(
                          padding: EdgeInsets.only(
                            right: getHorizontalSize(
                              15.00,
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {
                              controller.boxCercaController.clear;
                            },
                            icon: Icon(
                              Icons.clear,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                        suffixConstraints: BoxConstraints(
                          minWidth: getHorizontalSize(
                            18.00,
                          ),
                          minHeight: getVerticalSize(
                            18.00,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: getPadding(
                            left: 30,
                            top: 48,
                            right: 30,
                          ),
                          child: Text(
                            "lbl_panini".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInterBold20Black900,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: getMargin(
                            left: 14,
                            top: 21,
                            right: 14,
                          ),
                          decoration: AppDecoration.outlineBlack9003f.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder15,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: getPadding(
                                  left: 14,
                                  top: 6,
                                  bottom: 6,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        getHorizontalSize(
                                          4.00,
                                        ),
                                      ),
                                      child: CommonImageView(
                                        imagePath: ImageConstant.img837403151,
                                        height: getSize(
                                          55.00,
                                        ),
                                        width: getSize(
                                          55.00,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 11,
                                        top: 17,
                                        bottom: 3,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "lbl_crudo".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtInterBold16,
                                            ),
                                          ),
                                          Padding(
                                            padding: getPadding(
                                              right: 10,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  "lbl_4_5".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      AppStyle.txtInterBold12,
                                                ),
                                                Padding(
                                                  padding: getPadding(
                                                    top: 1,
                                                    bottom: 3,
                                                  ),
                                                  child: CommonImageView(
                                                    svgPath:
                                                        ImageConstant.imgStar,
                                                    height: getSize(
                                                      11.00,
                                                    ),
                                                    width: getSize(
                                                      11.00,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              CustomButton(
                                width: 57,
                                text: "lbl_1_50".tr,
                                margin: getMargin(
                                  top: 15,
                                  right: 13,
                                  bottom: 15,
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
                            left: 14,
                            top: 15,
                            right: 14,
                          ),
                          child: Obx(
                            () => ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.homeModelObj.value
                                  .list837403151OneItemList.length,
                              itemBuilder: (context, index) {
                                List837403151OneItemModel model = controller
                                    .homeModelObj
                                    .value
                                    .list837403151OneItemList[index];
                                return List837403151OneItemWidget(
                                  model,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: getPadding(
                            left: 14,
                            top: 15,
                            right: 14,
                          ),
                          child: Obx(
                            () => ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.homeModelObj.value
                                  .list837403151FourItemList.length,
                              itemBuilder: (context, index) {
                                List837403151FourItemModel model = controller
                                    .homeModelObj
                                    .value
                                    .list837403151FourItemList[index];
                                return List837403151FourItemWidget(
                                  model,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: getMargin(
                            top: 24,
                          ),
                          decoration: AppDecoration.outlineGray200.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder33,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: getPadding(
                                  left: 46,
                                  top: 23,
                                  bottom: 276,
                                ),
                                child: CommonImageView(
                                  svgPath: ImageConstant.imgUser,
                                  height: getSize(
                                    38.00,
                                  ),
                                  width: getSize(
                                    38.00,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  top: 23,
                                  bottom: 276,
                                ),
                                child: CommonImageView(
                                  imagePath: ImageConstant.imgHome1,
                                  height: getSize(
                                    39.00,
                                  ),
                                  width: getSize(
                                    39.00,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  top: 18,
                                  right: 36,
                                  bottom: 273,
                                ),
                                child: CommonImageView(
                                  imagePath: ImageConstant.imgCart1,
                                  height: getVerticalSize(
                                    47.00,
                                  ),
                                  width: getHorizontalSize(
                                    50.00,
                                  ),
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
          ],
        ),
      ),
    );
  }
}
