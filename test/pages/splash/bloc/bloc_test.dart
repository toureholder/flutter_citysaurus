import 'dart:async';

import 'package:citysaurus/core/models/models.dart';
import 'package:citysaurus/pages/pages.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../test_util/test_util.dart';

void main() {
  late MockAttractionListStreamController mockController;
  late MockAttractionListStreamSink mockSink;
  late MockAttractionService mockService;
  late SplashBloc bloc;

  setUp(() {
    mockController = MockAttractionListStreamController();
    mockSink = MockAttractionListStreamSink();
    mockService = MockAttractionService();
    bloc = SplashBloc(
      attractionService: mockService,
      controller: mockController,
    );

    when(() => mockController.sink).thenReturn(mockSink);
    final stream = StreamController<List<Attraction>>.broadcast().stream;
    when(() => mockController.stream).thenAnswer((_) => stream);
    when(() => mockController.isClosed).thenAnswer((_) => false);
    when(() => mockController.close()).thenAnswer((_) async => null);
  });

  test('calls service', () async {
    // When
    await bloc.loadAttractions();

    // Then
    verify(() => mockService.list());
  });

  test('adds the items the api returns to stream sink', () async {
    // Given
    when(() => mockService.list())
        .thenAnswer((_) async => Attraction.fakeList());

    // When
    await bloc.loadAttractions();

    // Then
    verify(() => mockSink.add(any()));
  });

  test('adds error to stream sink if api throws an exception', () async {
    // Given
    when(() => mockService.list()).thenThrow(Error());

    // When
    await bloc.loadAttractions();

    // Then
    verify(() => mockSink.addError(any())).called(1);
  });

  test('doesn\'t add error to stream sink if controller is closed', () async {
    // Given
    when(() => mockService.list()).thenThrow(Error());
    when(() => mockController.isClosed).thenAnswer((_) => true);

    // When
    await bloc.loadAttractions();

    // Then
    verifyNever(() => mockSink.addError(any()));
  });
}
