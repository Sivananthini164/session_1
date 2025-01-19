import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:session_1/screens/login/login_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: const LoginScreen(),
    );
  }
}
