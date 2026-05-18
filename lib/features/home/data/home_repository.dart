import 'package:moviemate_app/features/home/data/repositories/movie/movie_real_repository.dart';
import 'package:moviemate_app/shared/models/highlight_model.dart';
import 'package:moviemate_app/shared/models/movie_model.dart';

class HomeRepository {
  final _movieRepository = MovieRealRepository();

  Future<(List<HighlightModel>, List<MovieModel>)> loadHomeData() async {
    final result = await _movieRepository.loadHomeData();
    return (result.highlights, result.movies);
  }
}
