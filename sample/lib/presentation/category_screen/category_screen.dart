import 'controller/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:sandwech/core/app_export.dart';

class CategoryScreen extends GetWidget<CategoryController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: getPadding(
                      bottom: 182,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: getVerticalSize(
                            632.00,
                          ),
                          width: getHorizontalSize(
                            300.00,
                          ),
                          margin: getMargin(
                            left: 46,
                            top: 73,
                            right: 44,
                          ),
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  height: getSize(
                                    199.00,
                                  ),
                                  width: getSize(
                                    199.00,
                                  ),
                                  margin: getMargin(
                                    left: 50,
                                    right: 50,
                                    bottom: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorConstant.red90075,
                                    borderRadius: BorderRadius.circular(
                                      getHorizontalSize(
                                        68.00,
                                      ),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: ColorConstant.black9003f,
                                        spreadRadius: getHorizontalSize(
                                          2.00,
                                        ),
                                        blurRadius: getHorizontalSize(
                                          2.00,
                                        ),
                                        offset: Offset(
                                          0,
                                          4,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  height: getSize(
                                    259.00,
                                  ),
                                  width: getSize(
                                    259.00,
                                  ),
                                  margin: getMargin(
                                    left: 19,
                                    top: 69,
                                    right: 19,
                                    bottom: 69,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorConstant.orange400A2,
                                    borderRadius: BorderRadius.circular(
                                      getHorizontalSize(
                                        68.00,
                                      ),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: ColorConstant.black9003f,
                                        spreadRadius: getHorizontalSize(
                                          2.00,
                                        ),
                                        blurRadius: getHorizontalSize(
                                          2.00,
                                        ),
                                        offset: Offset(
                                          0,
                                          4,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: getSize(
                                    199.00,
                                  ),
                                  width: getSize(
                                    199.00,
                                  ),
                                  margin: getMargin(
                                    left: 50,
                                    top: 10,
                                    right: 50,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorConstant.orange40075,
                                    borderRadius: BorderRadius.circular(
                                      getHorizontalSize(
                                        68.00,
                                      ),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: ColorConstant.black9004c,
                                        spreadRadius: getHorizontalSize(
                                          2.00,
                                        ),
                                        blurRadius: getHorizontalSize(
                                          2.00,
                                        ),
                                        offset: Offset(
                                          0,
                                          4,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Card(
                                  clipBehavior: Clip.antiAlias,
                                  elevation: 0,
                                  margin: getMargin(
                                    left: 20,
                                    top: 69,
                                    right: 20,
                                    bottom: 69,
                                  ),
                                  color: ColorConstant.red900A2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder68,
                                  ),
                                  child: Container(
                                    height: getSize(
                                      259.00,
                                    ),
                                    width: getSize(
                                      259.00,
                                    ),
                                    decoration: AppDecoration.outlineBlack9004c
                                        .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder68,
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(
                                            padding: getPadding(
                                              left: 47,
                                              top: 13,
                                              right: 47,
                                              bottom: 13,
                                            ),
                                            child: CommonImageView(
                                              imagePath: ImageConstant.imgCan1,
                                              height: getVerticalSize(
                                                165.00,
                                              ),
                                              width: getHorizontalSize(
                                                164.00,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                  padding: getPadding(
                                    left: 50,
                                    top: 57,
                                    right: 50,
                                    bottom: 57,
                                  ),
                                  child: CommonImageView(
                                    imagePath: ImageConstant.imgPanino1,
                                    height: getVerticalSize(
                                      199.00,
                                    ),
                                    width: getHorizontalSize(
                                      198.00,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Card(
                                  clipBehavior: Clip.antiAlias,
                                  elevation: 0,
                                  margin: getMargin(
                                    top: 164,
                                    bottom: 164,
                                  ),
                                  color: ColorConstant.deepOrangeA700,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder33,
                                  ),
                                  child: Container(
                                    height: getSize(
                                      300.00,
                                    ),
                                    width: getSize(
                                      300.00,
                                    ),
                                    decoration: AppDecoration.outlineBlack9004c1
                                        .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder33,
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: getPadding(
                                              left: 28,
                                              top: 26,
                                              right: 26,
                                              bottom: 27,
                                            ),
                                            child: CommonImageView(
                                              imagePath:
                                                  ImageConstant.imgBrioches1,
                                              height: getVerticalSize(
                                                247.00,
                                              ),
                                              width: getHorizontalSize(
                                                246.00,
                                              ),
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
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: getMargin(
                              top: 56,
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
            ),
          ],
        ),
      ),
    );
  }
}
