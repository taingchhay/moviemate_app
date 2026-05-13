class HighlightModel {
  final String title;
  final String image;

  HighlightModel({
    required this.title,
    required this.image,
  });

  factory HighlightModel.fromJson(Map<String, dynamic> json) {
    return HighlightModel(
      title: json['title'],
      image: json['image'],
    );
  }
}