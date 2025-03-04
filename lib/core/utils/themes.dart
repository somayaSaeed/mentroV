import 'package:flutter/material.dart';
import 'package:mentroverso/core/utils/color_resources.dart';

abstract class Styles {
  static TextStyle textStyle24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: ColorResources.softWhite,
  );

  static TextStyle textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: ColorResources.softWhite,
  );

  static TextStyle textStyle12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: ColorResources.neutralGray,
  );

  static TextStyle textStyle13 = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: ColorResources.neutralGray,
  );

  static TextStyle textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ColorResources.softWhite,
  );
  static TextStyle textStyle14SoftPink = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ColorResources.softPinkishWhite,
  );
  static TextStyle textStyle15 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: ColorResources.softWhite,
  );

  static TextStyle textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: ColorResources.softWhite,
      shadows: [
        Shadow(
          color: Colors.black.withOpacity(0.1),
          offset: const Offset(1, 1),
          blurRadius: 2,
        ),
      ]

  );

  static TextStyle textStyle16p = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ColorResources.deepPink,
    decoration: TextDecoration.underline,
    decorationColor: ColorResources.deepPink,
  );

  static TextStyle textStyle12SoftPink = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: ColorResources.softPinkishWhite,
      shadows: [
        Shadow(
          color: Colors.black.withOpacity(0.1),
          offset: const Offset(1, 1),
          blurRadius: 2,
        ),
      ]

  );
}
