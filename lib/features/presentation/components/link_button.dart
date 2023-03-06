import 'package:flutter/material.dart';
import 'package:katana_mobile/core/constants/palette.dart';

class LinkButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const LinkButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: Palette.white),
        ));
  }
}
