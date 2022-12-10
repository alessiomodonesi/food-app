import '../controller/home_controller.dart';
import '../models/list837403151_four_item_model.dart';
import 'package:flutter/material.dart';
import 'package:sandwech/core/app_export.dart';
import 'package:sandwech/widgets/custom_button.dart';

// ignore: must_be_immutable
class List837403151FourItemWidget extends StatelessWidget {
  List837403151FourItemWidget(this.list837403151FourItemModelObj);

  List837403151FourItemModel list837403151FourItemModelObj;

  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: getMargin(
          top: 7.5,
          bottom: 7.5,
        ),
        decoration: AppDecoration.outlineBlack9003f.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder15,
        ),
        child: Row(
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
                mainAxisSize: MainAxisSize.max,
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
                      top: 16,
                      bottom: 3,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "lbl_cotto_maionese".tr,
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "lbl_4_5".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtInterBold12,
                              ),
                              Padding(
                                padding: getPadding(
                                  top: 1,
                                  bottom: 3,
                                ),
                                child: CommonImageView(
                                  svgPath: ImageConstant.imgStar,
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
                left: 83,
                top: 15,
                right: 13,
                bottom: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
