import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static final TextStyle titleLarge = GoogleFonts.poppins(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.grey[100],
  );

  static final TextStyle titleMedium = GoogleFonts.poppins(
    fontSize: 24,
    color: Colors.grey[100],
  );

  static final TextStyle titleSmall = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.grey[100],
  );

  static final TextStyle bodyMedium = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.grey[100],
  );

  static final TextStyle bodySmall = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.grey[100],
  );
}
