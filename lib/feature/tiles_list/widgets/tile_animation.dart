import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:rijksmuseum/models/tile_model.dart';
import 'package:rijksmuseum/theme/app_theme.dart';
import 'package:rijksmuseum/feature/tile_details/tile_detail_page.dart';

class TileAnimation extends StatelessWidget {
  final int itemNo;
  final TileModel tile;
  final bool isGridView;

  const TileAnimation({super.key, this.itemNo = 0, required this.tile, required this.isGridView});

  @override
  Widget build(BuildContext context) {
    ContainerTransitionType transitionType = ContainerTransitionType.fade;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: OpenContainer<bool>(
        transitionType: transitionType,
        openBuilder: (BuildContext _, VoidCallback openContainer) {
          return TileDetailPage(
            tile: tile,
          );
        },
        closedShape: const RoundedRectangleBorder(),
        closedElevation: 0.0,
        closedBuilder: (BuildContext _, VoidCallback openContainer) {
          return Container(
            //width: MediaQuery.of(context).size.width * 0.45,
            decoration: BoxDecoration(
              color: AppTheme.of(context).secondaryBackground,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 4,
                  color: Color(0x3600000F),
                  offset: Offset(0, 2),
                )
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                          child: Image.network(
                            isGridView ? tile.webImageUrl : tile.headerImageUrl,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                    child: Text(
                      tile.title,
                      softWrap: false,
                      style: AppTheme.of(context).bodyText1,
                      overflow: TextOverflow.ellipsis, // Recommended for handling overflow visually
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                          child: Text(
                            '\$${tile.price}',
                            style: AppTheme.of(context).bodyText2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
