import 'package:rijksmuseum/tiles_list/models/tile_model.dart';

abstract class TilesListState {}

class TileInitial extends TilesListState {}

class TilesLoading extends TilesListState {}

class TilesLoaded extends TilesListState {
  final List<TileModel> tiles;
  TilesLoaded(this.tiles);
}

class TileLoading extends TilesListState {}

class TileLoaded extends TilesListState {
  final TileModel tile;
  TileLoaded(this.tile);
}

class TileError extends TilesListState {
  final String message;
  TileError(this.message);
}
