import 'package:flutter/material.dart';

Widget heightSpacing({double mHeight = 11}) {
  return SizedBox(
    height: mHeight,
  );
}

Widget widthSpacing({double mWidth = 11}) {
  return SizedBox(
    width: mWidth,
  );
}

TextStyle mTextStyle43(
    {FontWeight mFontWeight = FontWeight.normal, Color mColor = Colors.black}) {
  return TextStyle(
      fontWeight: mFontWeight,
      color: mColor,
      fontSize: 43,
      fontFamily: 'poppinsFont');
}

/// Heading
TextStyle mTextStyle34(
    {FontWeight mFontWeight = FontWeight.normal, Color mColor = Colors.black}) {
  return TextStyle(
      fontWeight: mFontWeight,
      color: mColor,
      fontSize: 34,
      fontFamily: 'poppinsFont');
}

///title
TextStyle mTextStyle25(
    {FontWeight mFontWeight = FontWeight.normal, Color mColor = Colors.black}) {
  return TextStyle(
      fontWeight: mFontWeight,
      color: mColor,
      fontSize: 25,
      fontFamily: 'poppinsFont');
}

//subtitle
TextStyle mTextStyle12(
    {FontWeight mFontWeight = FontWeight.normal, Color mColor = Colors.black}) {
  return TextStyle(
      fontWeight: mFontWeight,
      color: mColor,
      fontSize: 12,
      fontFamily: 'poppinsFont');
}

//body
TextStyle mTextStyle16(
    {FontWeight mFontWeight = FontWeight.normal, Color mColor = Colors.black}) {
  return TextStyle(
      fontWeight: mFontWeight,
      color: mColor,
      fontSize: 16,
      fontFamily: 'poppinsFont');
}
