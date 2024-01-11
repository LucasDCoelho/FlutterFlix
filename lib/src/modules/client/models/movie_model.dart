import 'package:flutter_flix_project_4/src/modules/client/models/content_details_model.dart';

class MovieModel extends ContentDetailsModel {
  final String releaseDate;
  final String backdropPath;
  final bool video;

  MovieModel({
    required this.releaseDate,
    required this.backdropPath,
    required this.video,
    required int id,
    required int voteCount,
    required double popularity,
    required double voteAverage,
    required String title,
    required String overview,
    required String posterPath,
  }) : super(
            id: id,
            title: title,
            overview: overview,
            posterPath: posterPath,
            voteCount: voteCount,
            popularity: popularity,
            voteAverage: voteAverage);

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      releaseDate: map['release_date'] ?? '',
      backdropPath: map['backdrop_path'] ?? '',
      video: map['video'] ?? false,
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      overview: map['overview'] ?? '',
      posterPath: map['poster_path'] ?? '',
      popularity: map["popularity"] ?? 0,
      voteCount: map["vote_count"] ?? 0,
      voteAverage: map["vote_average"] ?? 0,
    );
  }
}
