class SerieModel {
  final int id;
  final String name;
  final String overview;
  final String posterPath;
  final String firstAirDate;

  SerieModel({
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.firstAirDate,
  });


  factory SerieModel.fromMap(Map<String, dynamic> map){
    return SerieModel(
      id: map['id'],
      name: map['name'],
      overview: map['overview'],
      posterPath: map['poster_path'],
      firstAirDate: map['first_air_date'],
    );
  }
}