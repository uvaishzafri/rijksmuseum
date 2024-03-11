abstract class TilesEvent {}

class LoadTiles extends TilesEvent {
  String query;

  LoadTiles({required this.query});
}

class LoadMoreTiles extends TilesEvent {}

class ToggleView extends TilesEvent {}
