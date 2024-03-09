import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rijksmuseum/repository/api_repository.dart';
import 'package:rijksmuseum/tiles_list/bloc/tiles_list_event.dart';
import 'package:rijksmuseum/tiles_list/bloc/tiles_list_state.dart';

class TilesListBloc extends Bloc<TilesListEvent, TilesListState> {
  final Api api;

  TilesListBloc(this.api) : super(TileInitial()) {
    on<LoadTiles>((event, emit) async {
      emit(TilesLoading());
      try {
        final tiles = await api.fetchTiles();
        emit(TilesLoaded(tiles));
      } catch (e) {
        emit(TileError(e.toString()));
      }
    });

    on<LoadTileDetails>((event, emit) async {
      emit(TileLoading());
      try {
        final tile = await api.fetchTileDetails(event.id);
        emit(TileLoaded(tile));
      } catch (e) {
        emit(TileError(e.toString()));
      }
    });
  }
}
