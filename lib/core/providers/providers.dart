import 'dart:async';

import 'package:citysaurus/core/models/models.dart';
import 'package:citysaurus/core/services/services.dart';
import 'package:citysaurus/pages/splash/bloc/bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:http/http.dart';

List<SingleChildWidget> getProviders() {
  final Client http = Client();

  final AttractionService attractionService = AttractionService(
    http: http,
  );

  final SplashBloc splashBloc = SplashBloc(
    attractionService: attractionService,
    controller: StreamController<List<Attraction>>.broadcast(),
  );

  return [
    Provider<SplashBloc?>(
      create: (_) => splashBloc,
    ),
  ];
}
