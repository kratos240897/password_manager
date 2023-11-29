import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static final colors = _Colors();
  static final textStyles = _TextStyles();
}

class _Colors {
  final kPrimaryColor = Colors.deepOrange;

  // static MaterialColor _getMaterialColorFromColor(Color color) {
  //   Map<int, Color> colorShades = {
  //     50: _getShade(color, value: 0.5),
  //     100: _getShade(color, value: 0.4),
  //     200: _getShade(color, value: 0.3),
  //     300: _getShade(color, value: 0.2),
  //     400: _getShade(color, value: 0.1),
  //     500: color, //Primary value
  //     600: _getShade(color, value: 0.1, darker: true),
  //     700: _getShade(color, value: 0.15, darker: true),
  //     800: _getShade(color, value: 0.2, darker: true),
  //     900: _getShade(color, value: 0.25, darker: true),
  //   };
  //   return MaterialColor(color.value, colorShades);
  // }

  // static Color _getShade(Color color,
  //     {bool darker = false, double value = .1}) {
  //   assert(value >= 0 && value <= 1);
  //   final hsl = HSLColor.fromColor(color);
  //   final hslDark = hsl.withLightness(
  //       (darker ? (hsl.lightness - value) : (hsl.lightness + value))
  //           .clamp(0.0, 1.0));
  //   return hslDark.toColor();
  // }
}

class _TextStyles {
  final _fontFamily = GoogleFonts.poppins().fontFamily;
  TextStyle f10Regular({String? fontFamily, Color? color}) => TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 10.sp,
      fontFamily: fontFamily ?? _fontFamily,
      color: color);

  TextStyle f10SemiBold({String? fontFamily, Color? color}) => TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily ?? _fontFamily,
      color: color);

  TextStyle f10Bold({String? fontFamily, Color? color}) => TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily ?? _fontFamily,
      color: color);

  TextStyle f12Regular({String? fontFamily, Color? color}) => TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 12.sp,
      fontFamily: fontFamily ?? _fontFamily,
      color: color);

  TextStyle f12SemiBold({String? fontFamily, Color? color}) => TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily ?? _fontFamily,
      color: color);

  TextStyle f12Bold({String? fontFamily, Color? color}) => TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily ?? _fontFamily,
      color: color);

  TextStyle f14Regular({String? fontFamily, Color? color}) => TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 14.sp,
      fontFamily: fontFamily ?? _fontFamily,
      color: color);

  TextStyle f14SemiBold({String? fontFamily, Color? color}) => TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily ?? _fontFamily,
      color: color);

  TextStyle f14Bold({String? fontFamily, Color? color}) => TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily ?? _fontFamily,
      color: color);

  TextStyle f16Regular({String? fontFamily, Color? color}) => TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 16.sp,
      fontFamily: fontFamily ?? _fontFamily,
      color: color);

  TextStyle f16SemiBold({String? fontFamily, Color? color}) => TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily ?? _fontFamily,
      color: color);

  TextStyle f16Bold({String? fontFamily, Color? color}) => TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily ?? _fontFamily,
      color: color);

  TextStyle f18Regular({String? fontFamily, Color? color}) => TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 18.sp,
      fontFamily: fontFamily ?? _fontFamily,
      color: color);

  TextStyle f18SemiBold({String? fontFamily, Color? color}) => TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily ?? _fontFamily,
      color: color);

  TextStyle f18Bold({String? fontFamily, Color? color}) => TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily ?? _fontFamily,
      color: color);

  TextStyle f20Regular({String? fontFamily, Color? color}) => TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 20.sp,
      fontFamily: fontFamily ?? _fontFamily,
      color: color);

  TextStyle f20SemiBold({String? fontFamily, Color? color}) => TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily ?? _fontFamily,
      color: color);

  TextStyle f20Bold({String? fontFamily, Color? color}) => TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily ?? _fontFamily,
      color: color);

  TextStyle f22Regular({String? fontFamily, Color? color}) => TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 22.sp,
      fontFamily: fontFamily ?? _fontFamily,
      color: color);

  TextStyle f22SemiBold({String? fontFamily, Color? color}) => TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily ?? _fontFamily,
      color: color);

  TextStyle f22Bold({String? fontFamily, Color? color}) => TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily ?? _fontFamily,
      color: color);
}
