import 'dart:convert';
import 'dart:io';
import 'package:rijksmuseum/models/tile_model.dart';

class MuseumRepository {
  final HttpClient httpClient;

  //TODO: Not a good practice to public out API Key but just doing it for sample app
  final String baseUrl = "https://www.rijksmuseum.nl/api/nl/collection?key=0fiuZFh4";

  MuseumRepository({required this.httpClient});

  Future<List<TileModel>> fetchTiles({int p = 0, int ps = 10, String q = ""}) async {
    try {
      final request = await httpClient.getUrl(Uri.parse('$baseUrl&p=$p&ps=$ps&q=$q'));
      final response = await request.close();
      if (response.statusCode == 200) {
        dynamic body = await response.transform(utf8.decoder).join();
        body = jsonDecode(body);
        List<TileModel> tiles = List<TileModel>.from(body["artObjects"].map((dynamic item) => TileModel.fromJson(item)).toList());
        tiles.removeWhere((element) => element.headerImageUrl == "" || element.webImageUrl == "");
        return tiles;
      } else {
        throw Exception('Failed to load tiles');
      }
    } catch (e) {
      throw Exception('Failed to load tiles: $e');
    }
  }
}
