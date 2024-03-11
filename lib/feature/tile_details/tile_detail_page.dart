import 'package:flutter/material.dart';
import 'package:rijksmuseum/models/tile_model.dart';
import 'package:rijksmuseum/theme/app_theme.dart';

class TileDetailPage extends StatelessWidget {
  TileDetailPage({Key? key, required this.tile}) : super(key: key);

  final TileModel tile;

  final scaffoldKey = GlobalKey<ScaffoldState>();

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
          ' ${tile.title}',
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
              child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Hero(
                        tag: 'mainImage',
                        child: Image.network(tile.headerImageUrl, fit: BoxFit.cover),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(tile.longTitle, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            Text('By ${tile.maker}',
                                style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic, color: Colors.deepPurple)),
                            const Divider(color: Colors.grey),
                            Text('Price: \$${tile.price}', style: const TextStyle(fontSize: 18)),
                            const SizedBox(height: 10),
                            if (tile.productionPlaces.isNotEmpty) ...{
                              const Text('Production Places:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            },
                            Wrap(
                              spacing: 8.0,
                              children: tile.productionPlaces
                                  .map((place) => Chip(
                                        label: Text(place),
                                        backgroundColor: Colors.deepPurple.withOpacity(0.5),
                                      ))
                                  .toList(),
                            ),
                            const SizedBox(height: 20),
                            tile.webImageUrl.isNotEmpty
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(tile.webImageUrl, fit: BoxFit.cover),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
