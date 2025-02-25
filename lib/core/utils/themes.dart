import 'package:flutter/cupertino.dart';
import 'package:mentroverso/core/utils/color_resources.dart';

abstract class Styles {
  static TextStyle textStyle24 = TextStyle(

    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: ColorResources.white,
  );

  static TextStyle textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: ColorResources.white,
  );

  static TextStyle textStyle12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: ColorResources.gry4,
  );
  static TextStyle textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ColorResources.white,
  );

  static TextStyle textStyle15 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: ColorResources.white,
  );

  static TextStyle textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ColorResources.white,
  );

  static TextStyle textStyle16p = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ColorResources.pink,
    decoration: TextDecoration.underline,
    decorationColor: ColorResources.pink,
  );


}
