import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'src/pages/user_profile_page.dart';

class RoutePaths {
  static const String root = '/';
  static const String home = '/home';
  static const String login = '/login';
  static const String signUp = '/sign_up';
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // AuthenticationBloc authenticationBloc;
  @override
  void initState() {
    // authenticationBloc = AuthenticationBloc();
    super.initState();
  }

  @override
  void dispose() {
    // authenticationBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.muliTextTheme(Theme.of(context).textTheme),
      ),
      home: UserProfile(),
    );
    // return BlocProvider<AuthenticationBloc>(
    //   bloc: authenticationBloc,
    //   child: BlocProvider<AppBloc>(
    //     bloc: AppBloc(),
    //     child: MaterialApp(
    //       title: 'Omny',
    //       supportedLocales: i18n.supportedLocales,
    //       theme: ThemeData(
    //         fontFamily: 'Montserrat',
    //         textTheme: TextTheme(
    //           button: OmnyTextStyles.button3.copyWith(
    //             color: OmnyColors.whiteNeutral,
    //           ),
    //         ),
    //       ),
    //       navigatorObservers: <NavigatorObserver>[
    //         DecisionObserver(authenticationBloc: authenticationBloc)
    //       ],
    //       initialRoute: RoutePaths.root,
    //       home: SplashPage(),
    //       onGenerateRoute: (RouteSettings settings) {
    //         switch (settings.name) {
    //           case RoutePaths.home:
    //             return MaterialPageRoute<String>(
    //                 builder: (_) => HomePage(), settings: settings);
    //           case RoutePaths.login:
    //             return MaterialPageRoute<String>(
    //                 builder: (_) => LoginPage(), settings: settings);
    //           case RoutePaths.signUp:
    //             return MaterialPageRoute<String>(
    //                 builder: (_) => SignUpPage(), settings: settings);
    //           default:
    //             return MaterialPageRoute<String>(
    //                 builder: (_) => NotFoundPage(), settings: settings);
    //         }
    //       },
    //       onUnknownRoute: (RouteSettings settings) => MaterialPageRoute<String>(
    //           builder: (_) => NotFoundPage(), settings: settings),
    //     ),
    //   ),
    // );
  }
}
