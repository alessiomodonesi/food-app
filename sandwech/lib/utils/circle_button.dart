import 'package:flutter/material.dart';

/// Widget per crare un pulsante rotondo, bianco
class ButtonCircle extends StatelessWidget {
  final double size;
  final GestureTapCallback onTap;
  final IconData iconData;
  final AlignmentGeometry iconAlignment;

  /// [double] size: rappresenta la grandezza del cerchio
  ///
  /// [GestureTapCallback] onTap: è la funzione che viene eseguita quando si clicca il pulsante
  ///
  /// [IconData] iconData: è l'icona che sta al centro del cerchio
  ///
  /// [AlignmentGeometry] iconAlignment: allineamento dell'icona rispetto al cerchio
  const ButtonCircle(this.size, this.onTap, this.iconData, this.iconAlignment,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Align(
          alignment: iconAlignment,
          child: Icon(
            iconData,
            color: Colors.black,
            size: 22,
          ),
        ),
      ),
    );
  }
}
