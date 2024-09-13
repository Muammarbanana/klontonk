import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      appBarTheme: AppBarTheme(
        centerTitle: false,
        actionsIconTheme: const IconThemeData(color: Color(0xFFC83D34)),
        titleTextStyle: GoogleFonts.urbanist(
          textStyle: const TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.lightBlue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      brightness: Brightness.light,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.all(15),
          foregroundColor: Colors.white,
          textStyle: GoogleFonts.urbanist(
            textStyle: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.lightBlue,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 0,
        extendedPadding: const EdgeInsets.all(15),
        foregroundColor: Colors.white,
        extendedTextStyle: GoogleFonts.urbanist(
          textStyle: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.lightBlue,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.lightBlue,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.lightBlue,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        hintStyle: GoogleFonts.urbanist(
          textStyle: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        labelStyle: GoogleFonts.urbanist(
          textStyle: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
      primaryColor: Colors.lightBlue,
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.urbanist(
          textStyle: const TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        bodyMedium: GoogleFonts.urbanist(
          textStyle: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        bodySmall: GoogleFonts.urbanist(
          textStyle: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
