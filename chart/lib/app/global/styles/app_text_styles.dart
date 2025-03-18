import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';

TextStyle get appStyle => GoogleFonts.inter(
  fontWeight: FontWeight.normal,
  fontSize: 14.sp,
  color: Colors.black,
  decoration: TextDecoration.none,
);

//Size
TextStyle get text10 => appStyle.copyWith(fontSize: 10.sp);
TextStyle get text11 => appStyle.copyWith(fontSize: 11.sp);
TextStyle get text12 => appStyle.copyWith(fontSize: 12.sp);
TextStyle get text13 => appStyle.copyWith(fontSize: 13.sp);
TextStyle get text14 => appStyle.copyWith(fontSize: 14.sp);
TextStyle get text15 => appStyle.copyWith(fontSize: 15.sp);
TextStyle get text16 => appStyle.copyWith(fontSize: 16.sp);
TextStyle get text17 => appStyle.copyWith(fontSize: 17.sp);
TextStyle get text18 => appStyle.copyWith(fontSize: 18.sp);
TextStyle get text20 => appStyle.copyWith(fontSize: 20.sp);
TextStyle get text22 => appStyle.copyWith(fontSize: 22.sp);
TextStyle get text23 => appStyle.copyWith(fontSize: 23.sp);
TextStyle get text24 => appStyle.copyWith(fontSize: 24.sp);
TextStyle get text26 => appStyle.copyWith(fontSize: 26.sp);
TextStyle get text28 => appStyle.copyWith(fontSize: 28.sp);
TextStyle get text30 => appStyle.copyWith(fontSize: 30.sp);
TextStyle get text32 => appStyle.copyWith(fontSize: 32.sp);
TextStyle get text34 => appStyle.copyWith(fontSize: 34.sp);
TextStyle get text40 => appStyle.copyWith(fontSize: 40.sp);

extension TextStyleExt on TextStyle {
  //* Decoration style
  TextStyle get underLine => copyWith(decoration: TextDecoration.underline);
  TextStyle get overLine => copyWith(decoration: TextDecoration.overline);
  TextStyle get thickNess2 => copyWith(decorationThickness: 2);

  //* Font Style
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  //* Weight style
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);
  TextStyle get normal => copyWith(fontWeight: FontWeight.w400);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);
  TextStyle get bold800 => copyWith(fontWeight: FontWeight.w800);
}
