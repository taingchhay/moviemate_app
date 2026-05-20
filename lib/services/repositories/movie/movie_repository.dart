import 'package:moviemate_app/models/highlight_model.dart';
import 'package:moviemate_app/models/movie_model.dart';

class DataResult {
  final List<HighlightModel> highlights;
  final List<MovieModel> movies;

  DataResult({required this.highlights, required this.movies});
}

abstract class MovieRepository {
  Future<DataResult> loadHomeData();
  Future<List<MovieModel>> getMovies();
  Future<List<HighlightModel>> getHighlights();
  Future<bool> isConnected();
}
