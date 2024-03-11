import 'package:flutter_test/flutter_test.dart';
import 'package:rijksmuseum/models/tile_model.dart';

void main() {
  group('TileModel', () {
    test('fromJson returns a valid model', () {
      final json = {
        'id': '1',
        'title': 'Test Title',
        'longTitle': 'Test Title, 2021',
        'webImage': {'url': 'https://example.com/image.jpg'},
        'headerImage': {'url': 'https://example.com/header.jpg'},
        'principalOrFirstMaker': 'Test Maker',
        'productionPlaces': ['Test Place'],
      };

      final result = TileModel.fromJson(json);

      expect(result, isA<TileModel>());
      expect(result.id, '1');
      expect(result.title, 'Test Title');
      expect(result.longTitle, 'Test Title, 2021');
      expect(result.webImageUrl, 'https://example.com/image.jpg');
      expect(result.headerImageUrl, 'https://example.com/header.jpg');
      expect(result.maker, 'Test Maker');
      expect(result.productionPlaces, ['Test Place']);
    });
  });
}
