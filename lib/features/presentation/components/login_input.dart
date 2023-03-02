import 'package:flutter/material.dart';
import 'package:katana_mobile/core/constants/palette.dart';

class LoginField extends StatelessWidget {
  final String hintText;
  const LoginField({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 400,
        ),
        child: TextFormField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(18),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Palette.fourth,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color:  Palette.fourth,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}
