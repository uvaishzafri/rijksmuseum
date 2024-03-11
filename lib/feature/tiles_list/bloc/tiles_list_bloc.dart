import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rijksmuseum/feature/tiles_list/bloc/tiles_list_event.dart';
import 'package:rijksmuseum/feature/tiles_list/bloc/tiles_list_state.dart';
import 'package:rijksmuseum/repository/api_repository.dart';

class TilesListBloc extends Bloc<TilesEvent, TilesState> {
  final Api api;
  bool isGridView = true; // Default view

  TilesListBloc(this.api) : super(TileInitial()) {
    on<LoadTiles>((event, emit) async {
      emit(TilesLoading());
      try {
        final tiles = await api.fetchTiles(query: "hi");

        emit(TilesLoaded(tiles));
      } catch (e) {
        emit(TilesError(e.toString()));
      }
    });

    on<ToggleView>((event, emit) {
      isGridView = !isGridView; // Toggle the view state
      if (state is TilesLoaded) {
        emit(TilesLoaded((state as TilesLoaded).tiles, isGridView: isGridView));
      }
    });
  }
}
