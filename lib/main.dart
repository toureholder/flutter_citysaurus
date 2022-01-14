import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:citysaurus/core/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  List<SingleChildWidget> providers = getProviders();

  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  runApp(MyApp(providers: providers, savedThemeMode: savedThemeMode));
}
