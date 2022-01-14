import 'dart:async';

import 'package:citysaurus/core/models/models.dart';
import 'package:citysaurus/core/services/services.dart';

class SplashBloc {
  SplashBloc({required this.attractionService, required this.controller});

  final AttractionService attractionService;
  final StreamController<List<Attraction>> controller;

  Stream<List<Attraction>> get stream => controller.stream;

  Future<void> dispose() => controller.close();

  Future<void> loadAttractions() async {
    try {
      final List<Attraction> attractions = await attractionService.list();
      controller.sink.add(attractions);
    } catch (error) {
      if (!controller.isClosed) {
        controller.sink.addError(error);
      }
    }
  }
}
