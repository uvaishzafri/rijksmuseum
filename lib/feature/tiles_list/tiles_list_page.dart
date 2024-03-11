import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rijksmuseum/bloc/tiles_list_bloc.dart';
import 'package:rijksmuseum/bloc/tiles_list_event.dart';
import 'package:rijksmuseum/bloc/tiles_list_state.dart';
import 'package:rijksmuseum/models/tile_model.dart';
import 'package:rijksmuseum/theme/app_theme.dart';
import 'package:rijksmuseum/feature/tiles_list/widgets/tile_list.dart';

class TileListPage extends StatefulWidget {
  const TileListPage({Key? key}) : super(key: key);

  @override
  _TileListPageState createState() => _TileListPageState();
}

class _TileListPageState extends State<TileListPage> {
  final ScrollController _scrollController = ScrollController();
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isSearchStarted = false;

  List<TileModel> searchedProducts = [];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    textController = TextEditingController();
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      BlocProvider.of<TilesListBloc>(context).add(LoadMoreTiles());
    }
  }


  @override
  void dispose() {
    _scrollController.dispose();
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Rijks Museum',
          style: AppTheme.of(context).title1,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppTheme.of(context).primaryBackground,
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                          child: Icon(
                            Icons.search_rounded,
                            color: Color(0xFF95A1AC),
                            size: 24,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                              child: BlocBuilder<TilesListBloc, TilesState>(
                                  bloc: context.read<TilesListBloc>()..add(LoadTiles(query: '')),
                                  builder: (_, tilesState) {
                                    return TextFormField(
                                      controller: textController,
                                      obscureText: false,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        'searchTilesDebounce', // Ensure this key is unique for this debounce
                                        const Duration(milliseconds: 500), // 500ms is a common choice for UI input
                                        () => BlocProvider.of<TilesListBloc>(context).add(
                                          LoadTiles(query: textController!.text.trim()), // Trigger search with current text
                                        ),
                                      ),
                                      decoration: const InputDecoration(
                                        labelText: 'Search product here...',
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                      ),
                                      style: AppTheme.of(context).bodyText1.override(
                                            fontFamily: 'Poppins',
                                            color: const Color(0xFF95A1AC),
                                          ),
                                    );
                                  })),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      BlocBuilder<TilesListBloc, TilesState>(builder: (_, __) {
                        TilesListBloc bloc = context.read<TilesListBloc>();
                        bool isGridView = bloc.isGridView;
                        return IconButton(
                            onPressed: () {
                              bloc.add(ToggleView());
                            },
                            icon: !isGridView ? const Icon(Icons.grid_on) : const Icon(Icons.list));
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<TilesListBloc, TilesState>(builder: (_, tilesState) {
            if (tilesState is TilesLoaded) {
              List<TileModel> tiles = tilesState.tiles;
              return Expanded(
                child: TilesList(
                  tiles: isSearchStarted ? searchedProducts : tiles,
                  scrollController: _scrollController,
                ),
              );
            }
            return const Expanded(child: Center(child: CircularProgressIndicator()));
          })
        ],
      ),
    );
  }
}
