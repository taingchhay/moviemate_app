import 'package:equatable/equatable.dart';
import 'package:moviemate_app/shared/models/highlight_model.dart';
import 'package:moviemate_app/shared/models/movie_model.dart';

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

class HomeSuccess extends HomeState {
  final List<HighlightModel> highlights;
  final List<MovieModel> movies;

  const HomeSuccess({required this.highlights, required this.movies});

  @override
  List<Object?> get props => [highlights, movies];
}

class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message});

  @override
  List<Object?> get props => [message];
}
