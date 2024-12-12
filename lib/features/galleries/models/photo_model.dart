class PhotoModel{
  final int id;
  final String photographer;
  final String photographerUrl;
  final String originalUrl;
  final String mediumUrl;
  final String smallUrl;

  PhotoModel({
    required this.id,
    required this.photographer,
    required this.photographerUrl,
    required this.originalUrl,
    required this.mediumUrl,
    required this.smallUrl
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json){
    return PhotoModel(
        id: json['id'],
        photographer: json['photographer'],
        photographerUrl: json['photographer_url'],
        originalUrl: json['src']['original'],
        mediumUrl: json['src']['medium'],
        smallUrl: json['src']['small']
    );
  }

}