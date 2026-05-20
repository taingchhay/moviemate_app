// import 'package:moviemate_app/features/home/data/dtos/highlight_dto.dart';
// import 'package:moviemate_app/features/home/data/dtos/movie_dto.dart';
// import 'package:moviemate_app/features/home/data/repositories/movie_repository.dart';
// import 'package:moviemate_app/shared/models/highlight_model.dart';
// import 'package:moviemate_app/shared/models/movie_model.dart';

// /// Movie Mock Repository - DEPRECATED: Use MovieRealRepository with Firebase instead
// /// Kept for reference only - do not use in production
// @deprecated
// class MovieMockRepository implements MovieRepository {
//   static final List<HighlightDTO> _highlights = [
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

//   static final List<MovieDTO> _movies = [
//     MovieDTO(
//       id: 1,
//       title: "Spider-Man: No Way Home",
//       image: "https://image.tmdb.org/t/p/w500/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg",
//       year: 2021,
//       type: "english",
//       soundType: "humanVoice",
//       category: "action",
//       rating: 8.3,
//     ),
//     MovieDTO(
//       id: 2,
//       title: "Joker",
//       image: "https://image.tmdb.org/t/p/w500/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg",
//       year: 2019,
//       type: "english",
//       soundType: "humanVoice",
//       category: "drama",
//       rating: 8.4,
//     ),
//     MovieDTO(
//       id: 3,
//       title: "Titanic",
//       image: "https://image.tmdb.org/t/p/w500/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg",
//       year: 1997,
//       type: "english",
//       soundType: "humanVoice",
//       category: "romance",
//       rating: 7.9,
//     ),
//     MovieDTO(
//       id: 4,
//       title: "John Wick",
//       image: "https://image.tmdb.org/t/p/w500/5vHssUeVe25bMrof1HyaPyWgaP.jpg",
//       year: 2014,
//       type: "english",
//       soundType: "humanVoice",
//       category: "action",
//       rating: 7.8,
//     ),
//     MovieDTO(
//       id: 5,
//       title: "Avatar",
//       image: "https://image.tmdb.org/t/p/w500/jRXYjXNq0Cs2TcJjLkki24MLp7u.jpg",
//       year: 2009,
//       type: "english",
//       soundType: "humanVoice",
//       category: "sci-fi",
//       rating: 7.8,
//     ),
//     MovieDTO(
//       id: 6,
//       title: "Black Panther",
//       image: "https://image.tmdb.org/t/p/w500/uxzzxijgPIY7slzFvMotPv8wjKA.jpg",
//       year: 2018,
//       type: "english",
//       soundType: "humanVoice",
//       category: "action",
//       rating: 7.3,
//     ),
//     MovieDTO(
//       id: 7,
//       title: "Doctor Strange",
//       image: "https://image.tmdb.org/t/p/w500/uGBVj3bEbCoZbD7v2mG6U7b7L.jpg",
//       year: 2016,
//       type: "english",
//       soundType: "aiVoice",
//       category: "fantasy",
//       rating: 7.5,
//     ),
//     MovieDTO(
//       id: 8,
//       title: "Fast & Furious 7",
//       image: "https://image.tmdb.org/t/p/w500/ktofZ9HtrjS4vQ2tQ0aX1.jpg",
//       year: 2015,
//       type: "english",
//       soundType: "aiVoice",
//       category: "action",
//       rating: 7.1,
//     ),
//     MovieDTO(
//       id: 9,
//       title: "Frozen",
//       image: "https://image.tmdb.org/t/p/w500/jIjdFXKUNtdf1bwqMrhearpyjMj.jpg",
//       year: 2013,
//       type: "english",
//       soundType: "humanVoice",
//       category: "animation",
//       rating: 7.4,
//     ),
//     MovieDTO(
//       id: 10,
//       title: "The Lion King",
//       image: "https://image.tmdb.org/t/p/w500/2bXbqYdUdNVa8VIWXVfclP2ICtT.jpg",
//       year: 1994,
//       type: "english",
//       soundType: "humanVoice",
//       category: "animation",
//       rating: 8.5,
//     ),
//     MovieDTO(
//       id: 11,
//       title: "Inception",
//       image: "https://image.tmdb.org/t/p/w500/9gk7adHYeDvHkCSEqAvQNLV5Uge.jpg",
//       year: 2010,
//       type: "english",
//       soundType: "humanVoice",
//       category: "sci-fi",
//       rating: 8.8,
//     ),
//     MovieDTO(
//       id: 12,
//       title: "The Batman",
//       image: "https://image.tmdb.org/t/p/w500/74xTEgt7R36Fpooo50r9T25onhq.jpg",
//       year: 2022,
//       type: "english",
//       soundType: "humanVoice",
//       category: "action",
//       rating: 7.9,
//     ),
//     MovieDTO(
//       id: 13,
//       title: "Top Gun: Maverick",
//       image: "https://image.tmdb.org/t/p/w500/62HCnUTziyWcpDaBO2i1DX17ljH.jpg",
//       year: 2022,
//       type: "english",
//       soundType: "humanVoice",
//       category: "action",
//       rating: 8.2,
//     ),
//     MovieDTO(
//       id: 14,
//       title: "Deadpool",
//       image: "https://image.tmdb.org/t/p/w500/3E53WEZJqP6aM84D8CckXx4pIHw.jpg",
//       year: 2016,
//       type: "english",
//       soundType: "aiVoice",
//       category: "action",
//       rating: 8.0,
//     ),
//     MovieDTO(
//       id: 15,
//       title: "Minions",
//       image: "https://image.tmdb.org/t/p/w500/vlOG6y8YvX9uZ4r2C8Yp.jpg",
//       year: 2015,
//       type: "english",
//       soundType: "aiVoice",
//       category: "animation",
//       rating: 6.4,
//     ),
//   ];

//   @override
//   Future<DataResult> loadHomeData() async {
//     try {
//       print('MovieMockRepository: Loading mock data...');

//       // Simulate network delay
//       await Future.delayed(const Duration(milliseconds: 500));

//       final highlights = await getHighlights();
//       final movies = await getMovies();

//       print(
//         'MovieMockRepository: Loaded ${highlights.length} highlights and ${movies.length} movies',
//       );

//       return DataResult(highlights: highlights, movies: movies);
//     } catch (e) {
//       print('MovieMockRepository Error: $e');
//       rethrow;
//     }
//   }

//   @override
//   Future<List<MovieModel>> getMovies() async {
//     try {
//       await Future.delayed(const Duration(milliseconds: 300));
//       return _movies.map((dto) => dto.toModel()).toList();
//     } catch (e) {
//       print('MovieMockRepository Error fetching movies: $e');
//       rethrow;
//     }
//   }

//   @override
//   Future<List<HighlightModel>> getHighlights() async {
//     try {
//       await Future.delayed(const Duration(milliseconds: 300));
//       return _highlights.map((dto) => dto.toModel()).toList();
//     } catch (e) {
//       print('MovieMockRepository Error fetching highlights: $e');
//       rethrow;
//     }
//   }

//   @override
//   Future<bool> isConnected() async {
//     return true;
//   }
// }
