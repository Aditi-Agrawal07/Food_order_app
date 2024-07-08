import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Icontext extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  final TextStyle textStyle;
  final MainAxisAlignment alignment;
  final double spacing;

  const Icontext({
    required this.icon,
    required this.text,
    this.iconColor = Colors.black,
    required this.textStyle,
    this.alignment = MainAxisAlignment.start,
    this.spacing = 8.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,
      children: [
       
        FaIcon(
          icon,
          color: iconColor,
        ),
        SizedBox(width: spacing),
        Text(
          text,
          style: textStyle,
        ),
      ],
    );
  }
}
