
# Rijksmuseum Flutter App

Welcome to the Rijksmuseum Flutter App repository! This application leverages Flutter and the Rijksmuseum API to present a collection of art items, demonstrating modern app development practices, including asynchronous data loading, pagination, error handling, and automated testing.

## Features

- **Overview Page**: Displays a list of art items with sections, headers, and asynchronous image loading.
- **Details Page**: Shows more information about an art item upon selection.
- **Progress Indications & Error Handling**: Enhances user experience during data fetching and errors.
- **Automated Testing**: Ensures app reliability with unit tests.

## Demo Video
https://github.com/uvaishzafri/rijksmuseum/assets/35339873/b3679342-6e4c-4bfa-970f-68e302519145

## Screenshots

*Home Page[List view]*

<img src="https://github.com/uvaishzafri/rijksmuseum/assets/35339873/8ff6bba5-2a0d-4637-8f6e-3e829d2ebd04" width="200" />

*Home Page[Gallery view]*

<img src="https://github.com/uvaishzafri/rijksmuseum/assets/35339873/085e580a-384f-47a6-aa6c-464e894e7706" width="200" />

*Home Page[Search result List view]*

<img src="https://github.com/uvaishzafri/rijksmuseum/assets/35339873/3b4cb36d-e17a-4f2b-a2c9-1ec399870feb" width="200" />

*Home Page[Search result Gallery view]*

<img src="https://github.com/uvaishzafri/rijksmuseum/assets/35339873/f1e83fd0-e1e1-468a-8cfb-ce29b452b744" width="200" />

*Home Page[Network error]*

<img src="https://github.com/uvaishzafri/rijksmuseum/assets/35339873/f368516d-62f6-4c70-89a7-ab4f7872b5a8" width="200" />

*Details Page*

<img src="https://github.com/uvaishzafri/rijksmuseum/assets/35339873/d960412c-4442-47f7-9e57-651c2acb9e5f" width="200" />

<img src="https://github.com/uvaishzafri/rijksmuseum/assets/35339873/94f7d26a-c407-4ea7-9d45-12adfa7e7f7e" width="200" />

## Project Setup and Architecture

This project embraces a clean architecture, ensuring scalability and maintainability. Here’s a brief overview:

- **BLoC (Business Logic Component)** for state management.
- **Repository Pattern** for data management.
- **Dependency Injection** for decoupling components.

## Code Structure

Here's the high-level structure of the project:

```plaintext
rijksmuseum_flutter_app/
├── android/
│   ├── src/...
│   └── build.gradle
├── ios/
│   ├── Flutter/
│   └── Runner.xcodeproj
├── lib/
│   ├── bloc/
│   │   ├── tiles_list_bloc.dart
│   │   ├── tiles_list_event.dart
│   │   └── tiles_list_state.dart
│   ├── models/
│   │   └── tile_model.dart
│   ├── repository/
│   │   └── museum_repository.dart
│   ├── feature/
│   │   ├── tile_details/
│   │   │   ├── tile_detail_page.dart
│   │   │   └── widgets/
│   │   │       └── tile.dart
│   │   └── tiles_list/
│   │       ├── tiles_list_page.dart
│   │       └── widgets/
│   │           ├── tile_animation.dart
│   │           └── tile_list.dart
│   ├── theme/
│   │   └── app_theme.dart
│   └── main.dart
├── test/
│   ├── bloc/
│   │   └── tiles_list_bloc_test.dart
│   ├── models/
│   │   └── tile_model_test.dart
│   └── repository/
│       └── museum_repository_test.dart
├── pubspec.yaml
└── README.md
```

## Plugins Used

- `flutter_bloc`: State management.
- `mockito`: Testing.

## Running the Project

1. Clone the repo and navigate into it.
2. Run `flutter pub get`.
3. Execute `flutter run` on a connected device/emulator.

## Testing

Execute `flutter pub run build_runner build` and `flutter test` in the
project directory to run the tests.
