import 'package:citysaurus/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

MaterialPageRoute getRouteFactory(settings) {
  MaterialPageRoute route;

  switch (settings.name) {
    case SplashScreen.routeName:
      {
        route = makeRoute(Consumer<SplashBloc>(
          builder: (context, bloc, child) => SplashScreen(bloc: bloc),
        )) as MaterialPageRoute;
      }
      break;
    case HomeScreen.routeName:
      {
        final HomeScreenArguments args = settings.arguments;
        route = makeRoute(
          HomeScreen(
            attractions: args.attractions,
          ),
        ) as MaterialPageRoute;
      }
      break;
    case DetailScreen.routeName:
      {
        final DetailScreenArguments args = settings.arguments;
        route = makeRoute(
          DetailScreen(
            attraction: args.attraction,
          ),
        ) as MaterialPageRoute;
      }
      break;
    default:
      {
        route = makeRoute(Consumer<SplashBloc>(
          builder: (context, bloc, child) => SplashScreen(bloc: bloc),
        )) as MaterialPageRoute;
      }
  }

  return route;
}

Route makeRoute(Widget page) => MaterialPageRoute(
      builder: (BuildContext context) => page,
    );
