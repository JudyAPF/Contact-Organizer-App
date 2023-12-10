import 'package:flores_assignment6/screens/contact_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(ContactOrganizerApp());
}

class ContactOrganizerApp extends StatelessWidget {
  ContactOrganizerApp({super.key});

  final colorScheme = ColorScheme.fromSeed(seedColor: const Color(0xFF205295));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: colorScheme,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.primaryContainer,
        ),
        // textTheme: TextTheme().copyWith(
        //   displayMedium: GoogleFonts.poppins(
        //     fontSize: 24,
        //     fontWeight: FontWeight.w500,
        //   ),
        // )
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          displayMedium: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      home: const ContactListScreen(),
    );
  }
}
 