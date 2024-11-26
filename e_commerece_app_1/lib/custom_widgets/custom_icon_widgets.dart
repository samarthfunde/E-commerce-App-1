import 'package:e_commerece_app_1/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomIconUI extends StatelessWidget {
  final double width;
  final double height;
  final Color? fgColor;
  final Color? bgColor;
  final IconData mIcon;
  final String? imgPath;

  // Constructor
  CustomIconUI(
      {required this.mIcon,
      this.width = 25.0,
      this.height = 25.0,
      this.bgColor,
      this.fgColor,
      this.imgPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: mIcon != " "
            ? Icon(mIcon, color: fgColor ?? AppColors.blackColor)
            : Image.asset(imgPath!),
      ),
    );
  }
}
