import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rijksmuseum/bloc/tiles_list_event.dart';
import 'package:rijksmuseum/bloc/tiles_list_state.dart';
import 'package:rijksmuseum/repository/museum_repository.dart';

class TilesListBloc extends Bloc<TilesEvent, TilesState> {
  final MuseumRepository api;
  bool isGridView = true; // Default view
  int currentPage = 0;
  bool hasMore = true; // Assuming there's more data initially
  final int pageSize = 10; // Default page size
  String currentQuery = ""; // Track the current search query

  TilesListBloc(this.api) : super(TileInitial()) {
    on<LoadTiles>((event, emit) async {
      currentPage = 0; // Reset for initial load
      hasMore = true;
      currentQuery = event.query; // Update with the provided query
      emit(TilesLoading());
      try {
        final tiles = await api.fetchTiles(p: currentPage, ps: pageSize, q: currentQuery);
        emit(TilesLoaded(tiles));
      } catch (e) {
        emit(TilesError(e.toString()));
      }
    });

    on<LoadMoreTiles>((event, emit) async {
      if (!hasMore || currentPage * pageSize >= 10000) return; // Check for maximum allowed value
      try {
        currentPage++;
        final tiles = await api.fetchTiles(p: currentPage, ps: pageSize, q: currentQuery);
        if (tiles.isEmpty) {
          hasMore = false; // No more data available
          return;
        }
        // Assuming TilesLoaded holds a list of all tiles loaded so far
        final currentState = state;
        if (currentState is TilesLoaded) {
          final allTiles = currentState.tiles + tiles;
          emit(TilesLoaded(allTiles));
        } else {
          emit(TilesLoaded(tiles));
        }
      } catch (e) {
        emit(TileError(e.toString()));
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
