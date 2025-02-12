import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static final TextStyle heading1 = GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle heading2 = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle heading3 = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle bodyText = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle caption = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w300,
  );
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      textTheme: TextTheme(
        displayLarge: AppTextStyles.heading1,
        displayMedium: AppTextStyles.heading2,
        displaySmall: AppTextStyles.heading3,
        bodyLarge: AppTextStyles.bodyText,
        bodyMedium: AppTextStyles.caption,
      ),
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      textTheme: TextTheme(
        displayLarge: AppTextStyles.heading1.copyWith(color: Colors.white),
        displayMedium: AppTextStyles.heading2.copyWith(color: Colors.white70),
        displaySmall: AppTextStyles.heading3.copyWith(color: Colors.white60),
        bodyLarge: AppTextStyles.bodyText.copyWith(color: Colors.white54),
        bodyMedium: AppTextStyles.caption.copyWith(color: Colors.white38),
      ),
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.grey[900],
    );
  }
}
