import 'dart:convert';

class BannerModel {
  final String image;
  final String id;
  BannerModel({required this.id, required this.image});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
    };
  }

  String toJson() => json.encode(toMap());

  factory BannerModel.fromJson(Map<String, dynamic> map) {
    return BannerModel(
      id: map['_id'] as String? ?? "",
      image: map['image'] as String? ?? "",
    );
  }

  /*
  factory BannerModel.fromMap(Map<String, dynamic> map) {
    return BannerModel(
      id: map['_id'],
      image: map['image'],
    );
  }
   */

/*
  factory BannerModel.fromJson(String source) =>
      BannerModel.fromMap(json.decode(source) as Map<String, dynamic>);
  */
}
