abstract class TilesEvent {}

class LoadTiles extends TilesEvent {}

class LoadTileDetails extends TilesEvent {
  final int id;

  LoadTileDetails(this.id);
}

class ToggleView extends TilesEvent {}
