import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:citysaurus/core/routes/routes.dart';
import 'package:citysaurus/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.providers,
    this.savedThemeMode,
  }) : super(key: key);

  final List<SingleChildWidget> providers;
  final AdaptiveThemeMode? savedThemeMode;

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: _lightTheme(),
      dark: _darkTheme(),
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MultiProvider(
        providers: providers,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: theme,
          darkTheme: darkTheme,
          initialRoute: SplashScreen.routeName,
          onGenerateRoute: getRouteFactory,
        ),
      ),
    );
  }

  ThemeData _lightTheme() => ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.soraTextTheme(),
      );

  ThemeData _darkTheme() => ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.soraTextTheme().apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
      );
}
