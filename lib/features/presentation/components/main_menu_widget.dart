import 'package:flutter/material.dart';
import 'package:katana_mobile/core/constants/palette.dart';
import 'package:sizer/sizer.dart';

class MainMenuWidget extends StatelessWidget {
  const MainMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          child: Icon(Icons.telegram),
          decoration: BoxDecoration(
            color: Palette.primary,
            borderRadius: BorderRadius.circular(30),
          ),
          height: 2.h,
        ),
      ),
    );
  }
}
