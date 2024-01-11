import 'package:flutter_flix_project_4/src/modules/client/models/content_details_model.dart';

class SeriesModel extends ContentDetailsModel {
  final String firstAirDate;

  SeriesModel({
    required this.firstAirDate,
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

  factory SeriesModel.fromMap(Map<String, dynamic> map) {
    return SeriesModel(
      firstAirDate: map['first_air_date'],
      id: map['id'],
      title: map['name'],
      overview: map['overview'],
      posterPath: map['poster_path'],
      popularity: map["popularity"] ?? 0,
      voteCount: map["vote_count"] ?? 0,
      voteAverage: map["vote_average"] ?? 0,
    );
  }
}
