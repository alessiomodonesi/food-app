import 'package:flutter/material.dart';
import 'package:sandwech/core/app_export.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.onTap,
      this.width,
      this.margin,
      this.prefixWidget,
      this.suffixWidget,
      this.text});

  ButtonShape? shape;

  ButtonPadding? padding;

  ButtonVariant? variant;

  ButtonFontStyle? fontStyle;

  Alignment? alignment;

  VoidCallback? onTap;

  double? width;

  EdgeInsetsGeometry? margin;

  Widget? prefixWidget;

  Widget? suffixWidget;

  String? text;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: getHorizontalSize(width ?? 0),
        margin: margin,
        padding: _setPadding(),
        decoration: _buildDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            prefixWidget ?? SizedBox(),
            Text(
              text ?? "",
              textAlign: TextAlign.center,
              style: _setFontStyle(),
            ),
            suffixWidget ?? SizedBox(),
          ],
        ),
      ),
    );
  }

  _buildDecoration() {
    return BoxDecoration(
      color: _setColor(),
      border: _setBorder(),
      borderRadius: _setBorderRadius(),
      boxShadow: _setBoxShadow(),
    );
  }

  _setPadding() {
    switch (padding) {
      default:
        return getPadding(
          all: 7,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.FillOrange400:
        return ColorConstant.orange400;
      case ButtonVariant.OutlineDeeporangeA700bc:
        return ColorConstant.redA400;
      case ButtonVariant.OutlineBlack9003f:
        return ColorConstant.gray201;
      case ButtonVariant.OutlineDeeporangeA700bc_1:
        return ColorConstant.orange400;
      default:
        return ColorConstant.redA400;
    }
  }

  _setBorder() {
    switch (variant) {
      case ButtonVariant.OutlineDeeporangeA700bc:
        return Border.all(
          color: ColorConstant.deepOrangeA700Bc,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineDeeporangeA700bc_1:
        return Border.all(
          color: ColorConstant.deepOrangeA700Bc,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.FillRedA400:
      case ButtonVariant.FillOrange400:
      case ButtonVariant.OutlineBlack9003f:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.CircleBorder30:
        return BorderRadius.circular(
          getHorizontalSize(
            30.00,
          ),
        );
      case ButtonShape.RoundedBorder21:
        return BorderRadius.circular(
          getHorizontalSize(
            21.50,
          ),
        );
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            15.00,
          ),
        );
    }
  }

  _setBoxShadow() {
    switch (variant) {
      case ButtonVariant.OutlineDeeporangeA700bc:
        return [
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
          )
        ];
      case ButtonVariant.OutlineBlack9003f:
        return [
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
          )
        ];
      case ButtonVariant.OutlineDeeporangeA700bc_1:
        return [
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
          )
        ];
      case ButtonVariant.FillRedA400:
      case ButtonVariant.FillOrange400:
        return null;
      default:
        return null;
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.InterBold36:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            36,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.InterBold35:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            35,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.InterBold17:
        return TextStyle(
          color: ColorConstant.redA400,
          fontSize: getFontSize(
            17,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        );
      default:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        );
    }
  }
}

enum ButtonShape {
  Square,
  RoundedBorder15,
  CircleBorder30,
  RoundedBorder21,
}

enum ButtonPadding {
  PaddingAll7,
}

enum ButtonVariant {
  FillRedA400,
  FillOrange400,
  OutlineDeeporangeA700bc,
  OutlineBlack9003f,
  OutlineDeeporangeA700bc_1,
}

enum ButtonFontStyle {
  InterBold16,
  InterBold36,
  InterBold35,
  InterBold17,
}
