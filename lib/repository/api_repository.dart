import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rijksmuseum/tiles_list/models/tile_model.dart';

class Api {
  final String baseUrl = "endpoint";

  Future<List<TileModel>> fetchTiles() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/tiles'));
      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        List<TileModel> tiles = body.map((dynamic item) => TileModel.fromJson(item)).toList();
        return tiles;
      } else {
        throw Exception('Failed to load tiles');
      }
    } catch (e) {
      throw Exception('Failed to load tiles: $e');
    }
  }

  Future<TileModel> fetchTileDetails(int id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/tiles/$id'));
      if (response.statusCode == 200) {
        dynamic body = jsonDecode(response.body);
        TileModel tile = TileModel.fromJson(body);
        return tile;
      } else {
        throw Exception('Failed to load tile details');
      }
    } catch (e) {
      throw Exception('Failed to load tile details: $e');
    }
  }
}
