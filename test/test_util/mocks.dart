import 'dart:async';

import 'package:citysaurus/core/models/models.dart';
import 'package:citysaurus/core/services/services.dart';
import 'package:citysaurus/pages/pages.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

class MockClient extends Mock implements Client {}

class MockAttractionService extends Mock implements AttractionService {}

class MockAttractionListStreamController extends Mock
    implements StreamController<List<Attraction>> {}

class MockAttractionListStreamSink extends Mock
    implements StreamSink<List<Attraction>> {}

class MockSplashBloc extends Mock implements SplashBloc {}
