import 'package:citysaurus/core/models/models.dart';
import 'package:citysaurus/pages/pages.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:provider/provider.dart';

import '../../../test_util/test_util.dart';

void main() {
  testWidgets('displays attraction information', (WidgetTester tester) async {
    await mockNetworkImagesFor(() async {
      final fakeAttraction = Attraction.fake();
      await tester.pumpWidget(makeTestableWidget(
        dependencies: [
          Provider<SplashBloc>(create: (_) => MockSplashBloc()),
        ],
        subject: DetailScreen(attraction: fakeAttraction),
      ));

      expect(find.text(fakeAttraction.name), findsOneWidget);
      expect(find.text(fakeAttraction.description), findsOneWidget);
    });
  });
}
