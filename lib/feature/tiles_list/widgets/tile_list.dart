import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rijksmuseum/feature/tiles_list/bloc/tiles_list_bloc.dart';
import 'package:rijksmuseum/feature/tiles_list/bloc/tiles_list_state.dart';
import 'package:rijksmuseum/feature/tiles_list/widgets/tile_animation.dart';
import 'package:rijksmuseum/models/tile_model.dart';

class TilesList extends StatelessWidget {
  const TilesList({super.key, required this.tiles, required this.scrollController});

  final List<TileModel> tiles;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TilesListBloc, TilesState>(builder: (_, tilesState) {
      TilesListBloc bloc = context.read<TilesListBloc>();
      bool isGridView = bloc.isGridView;
      if (isGridView) {
        return LayoutBuilder(builder: (context, constraints) {
          return GridView.builder(
            controller: scrollController,
            itemCount: tiles.length,
            itemBuilder: (context, index) => TileAnimation(
              itemNo: index,
              tile: tiles[index],
              isGridView: isGridView,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: constraints.maxWidth > 700 ? 4 : 2,
              childAspectRatio: 1,
            ),
          );
        });
      } else {
        return ListView.builder(
            controller: scrollController,
            itemCount: tiles.length,
            itemBuilder: (BuildContext context, int index) {
              return TileAnimation(
                itemNo: index,
                tile: tiles[index],
                isGridView: isGridView,
              );
            });
      }
    });
  }
}
