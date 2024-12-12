class PhotoModel{
  final int id;
  final String photographer;
  final String photographerUrl;
  final String originalUrl;
  final String mediumUrl;

  PhotoModel({
    required this.id,
    required this.photographer,
    required this.photographerUrl,
    required this.originalUrl,
    required this.mediumUrl
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json){
    return PhotoModel(
        id: json['id'],
        photographer: json['photographer'],
        photographerUrl: json['photographer_url'],
        originalUrl: json['src']['original'],
        mediumUrl: json['src']['medium']);
  }

}