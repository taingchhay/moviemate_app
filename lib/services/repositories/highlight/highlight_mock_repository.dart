// import 'package:moviemate_app/features/home/data/dtos/highlight_dto.dart';
// import 'package:moviemate_app/features/home/data/repositories/movie_repository.dart';
// import 'package:moviemate_app/shared/models/highlight_model.dart';
// import 'package:moviemate_app/shared/models/movie_model.dart';

// /// Highlight Mock Repository - DEPRECATED: Use MovieRealRepository with Firebase instead
// /// Kept for reference only - do not use in production
// @deprecated
// class HighlightMockRepository implements MovieRepository {
//   static final List<HighlightDTO> _highlightMovies = [
//     HighlightDTO(
//       title: "Interstellar",
//       image: "https://image.tmdb.org/t/p/w500/rAiYTfKGqDCRIIqo664sY9XZIvQ.jpg",
//     ),
//     HighlightDTO(
//       title: "Avengers: Endgame",
//       image: "https://image.tmdb.org/t/p/w500/ulzhLuWrPK07P1YkdW6n0m5Q4aZ.jpg",
//     ),
//     HighlightDTO(
//       title: "The Dark Knight",
//       image: "https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg",
//     ),
//     HighlightDTO(
//       title: "Dune",
//       image: "https://image.tmdb.org/t/p/w500/d5NXSklXo0qyIYkgV94XAgMIckC.jpg",
//     ),
//   ];

//   @override
//   Future<DataResult> loadHomeData() async {
//     return DataResult(highlights: await getHighlights(), movies: []);
//   }

//   @override
//   Future<List<MovieModel>> getMovies() async {
//     return [];
//   }

//   @override
//   Future<List<HighlightModel>> getHighlights() async {
//     return _highlightMovies.map((dto) => dto.toModel()).toList();
//   }

//   @override
//   Future<bool> isConnected() async {
//     return true;
//   }
// }
