import 'package:citysaurus/core/services/attraction_service.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../test_util/test_util.dart';

void main() {
  final MockClient mockClient = MockClient();
  final AttractionService service = AttractionService(http: mockClient);

  test('returns a list of attractions if the http call succeeds', () async {
    // Given
    const String fakeResponseBody =
        '[{"id":1,"city":"Cuzco","name":"Machu Picchu","image":"https://www.educaciontrespuntocero.com/wp-content/uploads/2018/01/machu-picchu.jpg","country":"Peru","description":"Considerada una obra maestra de la arquitectura y la ingeniera, es uno de los destinos turísticos más populares del mundo y Patrimonio de la Humanidad de la Unesco desde 1983. Su nombre en quechua significa y su origen corresponde a una Ilaqta (antiguo poblado andino). Construido antes del siglo XV se sitúa a 2.490 metros sobre el nivel del mar en la cordillera Central al Sur de Perú."}, {"id":2,"city":"Cuzco","name":"Machu Picchu","image":"https://www.educaciontrespuntocero.com/wp-content/uploads/2018/01/machu-picchu.jpg","country":"Peru","description":"Considerada una obra maestra de la arquitectura y la ingeniera, es uno de los destinos turísticos más populares del mundo y Patrimonio de la Humanidad de la Unesco desde 1983. Su nombre en quechua significa y su origen corresponde a una Ilaqta (antiguo poblado andino). Construido antes del siglo XV se sitúa a 2.490 metros sobre el nivel del mar en la cordillera Central al Sur de Perú."}]';

    when(
      () => mockClient.get(
        Uri.parse('https://api.npoint.io/5ecaa20ebea4d86084e5'),
        headers: any(named: 'headers'),
      ),
    ).thenAnswer((_) async => Response(fakeResponseBody, 200));

    // When
    final list = await service.list();
    final fistItem = list.first;

    expect(fistItem.id, 1);
    expect(fistItem.city.name, 'Cuzco');
    expect(fistItem.name, 'Machu Picchu');
  });
}
