import 'package:dating_profile/src/pages/image_view_page.dart';
import 'package:dating_profile/src/pages/user_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoutePaths {
  static const String userProfile = '/user_profile';
  static const String imageView = '/image_view';
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.muliTextTheme(Theme.of(context).textTheme),
      ),
      home: UserProfilePage(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case RoutePaths.userProfile:
            return MaterialPageRoute<String>(
                builder: (_) => UserProfilePage(), settings: settings);
          case RoutePaths.imageView:
            final urlImage = settings.arguments;

            return MaterialPageRoute<String>(
                builder: (_) => ImageViewPage(url: urlImage),
                settings: settings);
        }
      },
    );
  }
}
