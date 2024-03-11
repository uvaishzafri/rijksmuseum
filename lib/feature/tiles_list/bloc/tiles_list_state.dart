import 'package:rijksmuseum/models/tile_model.dart';

abstract class TilesState {}

class TileInitial extends TilesState {}

class TilesLoading extends TilesState {}

class TilesLoaded extends TilesState {
  final List<TileModel> tiles;
  final bool isGridView;

  TilesLoaded(this.tiles, {this.isGridView = true});
}

class TilesError extends TilesState {
  final String message;

  TilesError(this.message);
}

class TileLoading extends TilesState {}

class TileLoaded extends TilesState {
  final TileModel tile;

  TileLoaded(this.tile);
}

class TileError extends TilesState {
  final String message;

  TileError(this.message);
}
