class MovieModel {
  final int id;
  final String title;
  final String image;
  final int year;
  final String type;
  final String soundType;
  final String category;
  final double rating;

  MovieModel({
    required this.id,
    required this.title,
    required this.image,
    required this.year,
    required this.type,
    required this.soundType,
    required this.category,
    required this.rating,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      year: json['year'],
      type: json['type'],
      soundType: json['soundType'],
      category: json['category'],
      rating: (json['rating'] as num).toDouble(),
    );
  }
}