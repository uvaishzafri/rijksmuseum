import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rijksmuseum/models/tile_model.dart';

class Api {
  //TODO: Not a good practice to public out API Key but just doing it for sample app
  final String baseUrl = "https://www.rijksmuseum.nl/api/nl/collection?key=0fiuZFh4";

  Future<List<TileModel>> fetchTiles({int p = 0, int ps = 10, String q = ""}) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl&p=$p&ps=$ps&q=$q'));
      if (response.statusCode == 200) {
        dynamic body = jsonDecode(response.body);
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
