import 'dart:convert';

class ImageModel {
  int? id;
  final String imageUrl;
  final String title;
  final String description;
  final int likes;
  final int views;
  final bool is_favorite;

  ImageModel(
      {this.id,
      required this.imageUrl,
      required this.title,
      required this.description,
      required this.likes,
      required this.views,
      required this.is_favorite});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'title': title,
      'description': description,
      'likes': likes,
      'views': views,
      'is_favorite': is_favorite,
    };
  }

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      id: map['id'],
      imageUrl: map['imageUrl'],
      title: map['title'],
      description: map['description'],
      likes: map['likes'],
      views: map['views'],
      is_favorite: map['is_favorite'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageModel.fromJson(String source) =>
      ImageModel.fromMap(json.decode(source));

  ImageModel copyWith({
    int? id,
    String? imageUrl,
    String? title,
    String? description,
    int? likes,
    int? views,
    bool? favorite,
  }) =>
      ImageModel(
        id: id ?? this.id,
        imageUrl: imageUrl ?? this.imageUrl,
        title: title ?? this.title,
        description: description ?? this.description,
        likes: likes ?? this.likes,
        views: views ?? this.views,
        is_favorite: favorite ?? this.is_favorite,
      );
}
