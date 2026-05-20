import 'package:moviemate_app/models/movie_model.dart';

class MovieDTO {
  final int id;
  final String title;
  final String image;
  final int year;
  final String type;
  final String soundType;
  final String category;
  final double rating;
  final List<String> actors;

  MovieDTO({
    required this.id,
    required this.title,
    required this.image,
    required this.year,
    required this.type,
    required this.soundType,
    required this.category,
    required this.rating,
    required this.actors,
  });

  factory MovieDTO.fromJson(Map<String, dynamic> json) {
    return MovieDTO(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      image: json['image'] as String? ?? '',
      year: json['year'] as int? ?? 0,
      type: json['type'] as String? ?? '',
      soundType: json['soundType'] as String? ?? '',
      category: json['category'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      actors: List<String>.from(json['actors'] as List? ?? []),
    );
  }

  factory MovieDTO.fromModel(MovieModel model) {
    return MovieDTO(
      id: model.id,
      title: model.title,
      image: model.image,
      year: model.year,
      type: model.type,
      soundType: model.soundType,
      category: model.category,
      rating: model.rating,
      actors: model.actors,
    );
  }

  MovieModel toModel() {
    return MovieModel(
      id: id,
      title: title,
      image: image,
      year: year,
      type: type,
      soundType: soundType,
      category: category,
      rating: rating,
      actors: actors,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'year': year,
      'type': type,
      'soundType': soundType,
      'category': category,
      'rating': rating,
      'actors': actors,
    };
  }
}
