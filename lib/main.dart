import 'package:earnizik/ui/pages/home.dart';
import 'package:earnizik/ui/pages/onboarding.dart';
import 'package:earnizik/ui/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Earnizik',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      initialRoute: SplashScreen.routeName,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          settings: settings,
          builder:(context) {
            switch (settings.name) {
              case OnBoardingPage.routeName: return const OnBoardingPage();
              case HomePage.routeName: return const HomePage();
              default: return const SplashScreen();
            }
          }
        );
      },
    );
  }
}
