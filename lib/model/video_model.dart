import 'dart:convert';

class VideoModel {
  final int id;
  final String title;
  final String videoUrl;
  final String coverPicture;
  VideoModel({
    required this.id,
    required this.title,
    required this.videoUrl,
    required this.coverPicture,
  });

  VideoModel copyWith({
    int? id,
    String? title,
    String? videoUrl,
    String? coverPicture,
  }) {
    return VideoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      videoUrl: videoUrl ?? this.videoUrl,
      coverPicture: coverPicture ?? this.coverPicture,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'videoUrl': videoUrl,
      'coverPicture': coverPicture,
    };
  }

  factory VideoModel.fromMap(map) {
    return VideoModel(
      id: map['id'].toInt(),
      title: map['title'] as String,
      videoUrl: map['videoUrl'] as String,
      coverPicture: map['coverPicture'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoModel.fromJson(String source) =>
      VideoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'VideoModel(id: $id, title: $title, videoUrl: $videoUrl, coverPicture: $coverPicture)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VideoModel &&
        other.id == id &&
        other.title == title &&
        other.videoUrl == videoUrl &&
        other.coverPicture == coverPicture;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        videoUrl.hashCode ^
        coverPicture.hashCode;
  }
}
