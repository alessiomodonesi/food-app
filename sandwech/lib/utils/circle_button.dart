import 'package:flutter/material.dart';

const Color ambratoApp = Color(0xFFFF9B18);
const Color rossoApp = Color(0xFFEE0F38);

/// Widget per crare un pulsante rotondo, bianco
class ButtonCircle extends StatelessWidget {
  final double size;
  final Color? backgroundColor;
  final IconData iconData;
  final AlignmentGeometry iconAlignment;
  final Color? iconColor;
  final GestureTapCallback onTap;

  /// [double] size: rappresenta la grandezza del cerchio
  ///
  /// [Color?] backgroundColor: colore dello sfondo del bottone
  ///
  /// [IconData] iconData: icona che sta al centro del cerchio
  ///
  /// [AlignmentGeometry] iconAlignment: allineamento dell'icona rispetto al cerchio
  ///
  /// [Color?] iconColor: colore dell'icona del bottone
  ///
  /// [GestureTapCallback] onTap: funzione che viene eseguita quando si clicca il pulsante

  const ButtonCircle(this.size, this.backgroundColor, this.iconData,
      this.iconAlignment, this.iconColor, this.onTap,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Align(
          alignment: iconAlignment,
          child: Icon(
            iconData,
            color: iconColor,
            size: 22,
          ),
        ),
      ),
    );
  }
}
