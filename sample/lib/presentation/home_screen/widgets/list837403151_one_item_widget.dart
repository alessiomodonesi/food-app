import '../controller/home_controller.dart';
import '../models/list837403151_one_item_model.dart';
import 'package:flutter/material.dart';
import 'package:sandwech/core/app_export.dart';
import 'package:sandwech/widgets/custom_button.dart';

// ignore: must_be_immutable
class List837403151OneItemWidget extends StatelessWidget {
  List837403151OneItemWidget(this.list837403151OneItemModelObj);

  List837403151OneItemModel list837403151OneItemModelObj;

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
                crossAxisAlignment: CrossAxisAlignment.center,
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
                      bottom: 17,
                    ),
                    child: Text(
                      "lbl_salame".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterBold16,
                    ),
                  ),
                ],
              ),
            ),
            CustomButton(
              width: 57,
              text: "lbl_1_50".tr,
              margin: getMargin(
                left: 150,
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
