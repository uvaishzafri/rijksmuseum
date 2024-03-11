import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rijksmuseum/bloc/tiles_list_bloc.dart';
import 'package:rijksmuseum/bloc/tiles_list_event.dart';
import 'package:rijksmuseum/bloc/tiles_list_state.dart';
import 'package:rijksmuseum/models/tile_model.dart';
import 'package:rijksmuseum/repository/museum_repository.dart';

class MockMuseumRepository extends Mock implements MuseumRepository {}

@GenerateMocks([MockMuseumRepository])
void main() {
  group('TilesListBloc', () {
    late MockMuseumRepository mockMuseumRepository;
    late TilesListBloc tilesListBloc;

    setUp(() {
      mockMuseumRepository = MockMuseumRepository();
      tilesListBloc = TilesListBloc(mockMuseumRepository);
    });

    blocTest<TilesListBloc, TilesState>(
      'emits [TilesLoading, TilesLoaded] when LoadTiles is added and repository returns data',
      build: () => tilesListBloc,
      act: (bloc) => bloc.add(LoadTiles(query: '')),
      setUp: () {
        when(mockMuseumRepository.fetchTiles(
            p: 0,
            ps: 10,
            q: ''
        )).thenAnswer((_) async => <TileModel>[
          TileModel(
              id: '1',
              title: 'Test Title',
              longTitle: 'Test Title, 2021',
              webImageUrl: 'https://example.com/image.jpg',
              headerImageUrl: 'https://example.com/header.jpg',
              price: 100,
              maker: 'Test Maker',
              productionPlaces: ['Test Place']
          )
        ]);
      },
      expect: () => [
        TilesLoading(),
        isA<TilesLoaded>(),
      ],
    );
  });
}
