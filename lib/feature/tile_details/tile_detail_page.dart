import 'package:flutter/material.dart';
import 'package:rijksmuseum/models/tile_model.dart';
import 'package:rijksmuseum/theme/app_theme.dart';

class TileDetailPage extends StatefulWidget {
  const TileDetailPage({Key? key, required this.tile}) : super(key: key);

  final TileModel tile;

  @override
  _TileDetailPageState createState() => _TileDetailPageState();
}

class _TileDetailPageState extends State<TileDetailPage> with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int? countControllerValue;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: AppTheme.of(context).secondaryText,
            size: 24,
          ),
        ),
        title: Text(
          ' ${widget.tile.title}',
          style: AppTheme.of(context).subtitle2.override(
            fontFamily: 'Lexend Deca',
            color: const Color(0xFF151B1E),
            fontSize: 26,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: AppTheme.of(context).secondaryBackground,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                    child: Hero(
                      tag: 'mainImage',
                      transitionOnUserGestures: true,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          widget.tile.headerImageUrl,
                          width: double.infinity,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: Text(
                      'Detailed Product',
                      style: AppTheme.of(context).title1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 0, 0),
                    child: Text(
                      '\$${widget.tile.price}',
                      textAlign: TextAlign.start,
                      style: AppTheme.of(context).subtitle1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do.',
                      style: AppTheme.of(context).bodyText2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}