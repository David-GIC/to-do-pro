import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle titleStyle = GoogleFonts.montserrat(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600));
  static TextStyle normalStyle = GoogleFonts.montserrat(textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal));
  static TextStyle normalGrayStyle =
      GoogleFonts.montserrat(textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.grey));
}
