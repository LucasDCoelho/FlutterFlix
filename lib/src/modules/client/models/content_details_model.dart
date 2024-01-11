class ContentDetailsModel {
  final int id;
  final int voteCount;
  final double popularity;
  final double voteAverage;
  final String title;
  final String overview;
  final String posterPath;


  ContentDetailsModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.popularity,
    required this.voteAverage,
    required this.voteCount,
  });
}