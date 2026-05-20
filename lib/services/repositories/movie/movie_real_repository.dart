import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moviemate_app/features/home/data/config/firebase_config.dart';
import 'package:moviemate_app/features/home/data/dtos/highlight_dto.dart';
import 'package:moviemate_app/features/home/data/dtos/movie_dto.dart';
import 'package:moviemate_app/services/repositories/movie/movie_repository.dart';
import 'package:moviemate_app/models/highlight_model.dart';
import 'package:moviemate_app/models/movie_model.dart';

class MovieRealRepository implements MovieRepository {
  Uri get _highlightUri =>
      FirebaseConfig.baseUrl.replace(path: '/highlight.json');

  Uri get _moviesUri => FirebaseConfig.baseUrl.replace(path: '/movies.json');

  Future<List<HighlightDTO>> _getHighlightDTOs() async {
    try {
      final response = await http.get(_highlightUri);
      if (response.statusCode != 200) {
        return [];
      }
      if (response.body == 'null') {
        return [];
      }

      final List<HighlightDTO> highlights = [];
      final json = jsonDecode(response.body);

      if (json is List) {
        for (var item in json) {
          if (item != null && item is Map) {
            try {
              highlights.add(
                HighlightDTO.fromJson(Map<String, dynamic>.from(item)),
              );
            } catch (e) {
              // Skip invalid items
            }
          }
        }
      } else if (json is Map) {
        json.forEach((key, value) {
          if (value is Map) {
            try {
              highlights.add(
                HighlightDTO.fromJson(Map<String, dynamic>.from(value)),
              );
            } catch (e) {
              // Skip invalid items
            }
          }
        });
      }

      return highlights;
    } catch (e) {
      return [];
    }
  }

  Future<List<MovieDTO>> _getMovieDTOs() async {
    try {
      final response = await http.get(_moviesUri);
      if (response.statusCode != 200) {
        return [];
      }
      if (response.body == 'null') {
        return [];
      }

      final List<MovieDTO> movies = [];
      final json = jsonDecode(response.body);

      if (json is List) {
        for (var item in json) {
          if (item != null && item is Map) {
            try {
              movies.add(MovieDTO.fromJson(Map<String, dynamic>.from(item)));
            } catch (e) {
              // Skip invalid items
            }
          }
        }
      } else if (json is Map) {
        json.forEach((key, value) {
          if (value is Map) {
            try {
              movies.add(MovieDTO.fromJson(Map<String, dynamic>.from(value)));
            } catch (e) {
              // Skip invalid items
            }
          }
        });
      }

      return movies;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<DataResult> loadHomeData() async {
    try {
      final highlightDTOs = await _getHighlightDTOs();
      final movieDTOs = await _getMovieDTOs();

      final highlights = highlightDTOs.map((dto) => dto.toModel()).toList();
      final movies = movieDTOs.map((dto) => dto.toModel()).toList();

      return DataResult(highlights: highlights, movies: movies);
    } catch (e) {
      return DataResult(highlights: [], movies: []);
    }
  }

  @override
  Future<List<MovieModel>> getMovies() async {
    try {
      final movieDTOs = await _getMovieDTOs();
      return movieDTOs.map((dto) => dto.toModel()).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<HighlightModel>> getHighlights() async {
    try {
      final highlightDTOs = await _getHighlightDTOs();
      return highlightDTOs.map((dto) => dto.toModel()).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<bool> isConnected() async {
    try {
      final response = await http
          .get(_moviesUri)
          .timeout(const Duration(seconds: 5));
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
