import 'package:citysaurus/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

Widget makeTestableWidget({
  Widget? subject,
  required List<SingleChildWidget> dependencies,
  List<NavigatorObserver?>? navigatorObservers,
  Locale? testingLocale,
}) {
  return MultiProvider(
    providers: dependencies,
    child: MaterialApp(
      onGenerateRoute: getRouteFactory,
      home: subject,
      navigatorObservers: navigatorObservers as List<NavigatorObserver>? ??
          const <NavigatorObserver>[],
    ),
  );
}
