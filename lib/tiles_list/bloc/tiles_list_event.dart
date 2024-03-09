abstract class TilesListEvent {}

class LoadTiles extends TilesListEvent {}

class LoadTileDetails extends TilesListEvent {
  final int id;
  LoadTileDetails(this.id);
}
