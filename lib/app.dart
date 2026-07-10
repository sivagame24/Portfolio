import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sivagame P — Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.bg,
        textTheme: GoogleFonts.notoSerifTextTheme(
          ThemeData.dark().textTheme,
        ),
        colorScheme: const ColorScheme.dark(
          primary: AppColors.accent,
          surface: AppColors.surface,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class AppColors {
  static const bg = Color(0xFF0A0E1A);
  static const surface = Color(0xFF111827);
  static const card = Color(0xFF1A2235);
  static const accent = Color(0xFF4F8EF7);
  static const accentGold = Color(0xFFE8B84B);
  static const textPrimary = Color(0xFFEEF2FF);
  static const textSecondary = Color(0xFF94A3B8);
  static const border = Color(0xFF1E2D45);
  static const gradient1 = Color(0xFF1A3A6B);
  static const gradient2 = Color(0xFF0D1F3C);
}
