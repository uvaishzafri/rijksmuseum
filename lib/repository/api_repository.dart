import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rijksmuseum/models/tile_model.dart';

class Api {
  //TODO: Not a good practice to public out API Key but just doing it for sample app
  final String baseUrl = "https://www.rijksmuseum.nl/api/nl/collection?key=0fiuZFh4";

  Future<List<TileModel>> fetchTiles({required String query}) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl&q=$query'));
      if (response.statusCode == 200) {
        dynamic body = jsonDecode(response.body);
        List<TileModel> tiles = List<TileModel>.from(body["artObjects"].map((dynamic item) => TileModel.fromJson(item)).toList());
        return tiles;
      } else {
        throw Exception('Failed to load tiles');
      }
    } catch (e) {
      throw Exception('Failed to load tiles: $e');
    }
  }
}
