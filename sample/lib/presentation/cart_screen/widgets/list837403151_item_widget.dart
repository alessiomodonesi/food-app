import '../controller/cart_controller.dart';
import '../models/list837403151_item_model.dart';
import 'package:flutter/material.dart';
import 'package:sandwech/core/app_export.dart';

// ignore: must_be_immutable
class List837403151ItemWidget extends StatelessWidget {
  List837403151ItemWidget(this.list837403151ItemModelObj);

  List837403151ItemModel list837403151ItemModelObj;

  var controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: getPadding(
          top: 7.0,
          bottom: 7.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              decoration: AppDecoration.outlineBlack9003f.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder15,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: getPadding(
                      left: 14,
                      top: 6,
                      bottom: 18,
                    ),
                    child: ClipRRect(
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
                  ),
                  Padding(
                    padding: getPadding(
                      left: 9,
                      top: 12,
                      bottom: 16,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "lbl_cotto_e_fontina".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInterBold16,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 9,
                            right: 10,
                          ),
                          child: Text(
                            "lbl_1_50".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInterBold16RedA400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: getMargin(
                      left: 48,
                      top: 24,
                      right: 7,
                      bottom: 24,
                    ),
                    decoration: AppDecoration.outlineWhiteA700.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder15,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: getPadding(
                            left: 9,
                            top: 6,
                            bottom: 6,
                          ),
                          child: CommonImageView(
                            svgPath: ImageConstant.imgCar,
                            height: getSize(
                              19.00,
                            ),
                            width: getSize(
                              19.00,
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 17,
                            top: 1,
                            bottom: 1,
                          ),
                          child: Text(
                            "lbl_1".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInterBold23,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 18,
                            top: 6,
                            right: 9,
                            bottom: 6,
                          ),
                          child: CommonImageView(
                            svgPath: ImageConstant.imgPlus,
                            height: getSize(
                              19.00,
                            ),
                            width: getSize(
                              19.00,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: getVerticalSize(
                23.00,
              ),
              width: getHorizontalSize(
                4.00,
              ),
              margin: getMargin(
                left: 9,
                top: 1,
                bottom: 55,
              ),
              decoration: BoxDecoration(
                color: ColorConstant.gray600,
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(
                    2.00,
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
