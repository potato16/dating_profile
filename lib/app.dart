import 'package:dating_profile/src/pages/user_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.muliTextTheme(Theme.of(context).textTheme),
      ),
      home: UserProfilePage(),
    );
  }
}
