class TileModel {
  final int id;
  final String name;
  final String imageUrl;
  final double price;

  TileModel({required this.id, required this.name, required this.imageUrl, required this.price});

  factory TileModel.fromJson(Map<String, dynamic> json) {
    return TileModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      price: json['price'].toDouble(),
    );
  }
}