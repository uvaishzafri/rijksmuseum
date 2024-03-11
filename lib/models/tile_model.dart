import 'dart:math';

class TileModel {
  final String id;
  final String title;
  final String longTitle;
  final String webImageUrl;
  final String headerImageUrl;
  final int price;
  final String maker;
  final List<String> productionPlaces;

  TileModel({
    required this.id,
    required this.title,
    required this.longTitle,
    required this.webImageUrl,
    required this.headerImageUrl,
    required this.price,
    required this.maker,
    required this.productionPlaces,
  });

  factory TileModel.fromJson(Map<String, dynamic> json) {
    return TileModel(
      id: json['id'],
      title: json['title'],
      longTitle: json['longTitle'],
      webImageUrl: json['webImage'] != null ? (json['webImage']['url'] ?? "") : "",
      headerImageUrl: json['headerImage'] != null ? (json['headerImage']['url'] ?? "") : "",
      price: Random().nextInt(100),
      maker: json['principalOrFirstMaker'],
      productionPlaces: List<String>.from(json['productionPlaces']),
    );
  }
}
