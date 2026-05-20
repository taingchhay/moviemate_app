import 'package:equatable/equatable.dart';
import 'package:moviemate_app/models/highlight_model.dart';
import 'package:moviemate_app/models/movie_model.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();

  @override
  List<Object?> get props => [];
}

class HomeLoading extends HomeState {
  const HomeLoading();

  @override
  List<Object?> get props => [];
}
//Select categories state
class HomeSuccess extends HomeState {
  final List<HighlightModel> highlights;
  final List<MovieModel> movies;
  final String selectedCategory;

  const HomeSuccess({
    required this.highlights,
    required this.movies,
    this.selectedCategory = 'All Movies',
  });

  List<MovieModel> get filteredMovies {
    if (selectedCategory == 'All Movies') {
      return movies;
    }
    return movies
        .where(
          (movie) =>
              movie.category.toLowerCase() == selectedCategory.toLowerCase(),
        )
        .toList();
  }

  @override
  List<Object?> get props => [highlights, movies, selectedCategory];
}

class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message});

  @override
  List<Object?> get props => [message];
}
