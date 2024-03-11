import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rijksmuseum/bloc/tiles_list_bloc.dart';
import 'package:rijksmuseum/feature/tiles_list/tiles_list_page.dart';
import 'package:rijksmuseum/repository/api_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TilesListBloc>(
          create: (BuildContext context) => TilesListBloc(Api()),
        ),
      ],
      child: MaterialApp(
        title: 'Rijs Museum',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TileListPage(),
      ),
    );
  }
}