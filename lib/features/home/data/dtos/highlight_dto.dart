import 'package:moviemate_app/shared/models/highlight_model.dart';

class HighlightDTO {
  final String title;
  final String image;

  HighlightDTO({required this.title, required this.image});

  factory HighlightDTO.fromJson(Map<String, dynamic> json) {
    return HighlightDTO(
      title: json['title'] as String? ?? '',
      image: json['image'] as String? ?? '',
    );
  }

  factory HighlightDTO.fromModel(HighlightModel model) {
    return HighlightDTO(title: model.title, image: model.image);
  }

  HighlightModel toModel() {
    return HighlightModel(title: title, image: image);
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'image': image};
  }
}
