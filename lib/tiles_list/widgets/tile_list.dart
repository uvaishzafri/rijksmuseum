import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rijksmuseum/tiles_list/bloc/tiles_list_bloc.dart';
import 'package:rijksmuseum/tiles_list/bloc/tiles_list_state.dart';
import 'package:rijksmuseum/tiles_list/models/tile_model.dart';
import 'package:rijksmuseum/tiles_list/widgets/tile_animation.dart';

class TilesList extends StatelessWidget {
  const TilesList({super.key, required this.tiles});

  final List<TileModel> tiles;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TilesListBloc, TilesListState>(builder: (_, cartState) {
      return ListView.builder(
          itemCount: tiles.length,
          itemBuilder: (BuildContext context, int index) {
            return TileAnimation(
              itemNo: index,
              tile: tiles[index],
            );
          });
    });
  }
}
