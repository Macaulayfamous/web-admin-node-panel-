import 'dart:convert';

class BuyerModel {
  final String id;
  final String fullName;
  final String email;
  final String city;
  final String state;
  final String locality;
  final String password;
  final String token;

  BuyerModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.city,
    required this.state,
    required this.locality,
    required this.password,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      'fullName': fullName,
      'email': email,
      'city': city,
      'state': state,
      'locality': locality,
      'password': password,
      'token': token,
    };
  }

  String toJson() => json.encode(toMap());

  factory BuyerModel.fromMap(Map<String, dynamic> map) {
    return BuyerModel(
      id: map['_id'] as String? ?? "",
      fullName: map['fullName'] as String? ?? "",
      email: map['email'] as String? ?? "",
      city: map['city'] as String? ?? "",
      state: map['state'] as String? ?? "",
      locality: map['locality'] as String? ?? "",
      password: map['password'] as String? ?? "",
      token: map['token'] as String? ?? "",
    );
  }

  /*
  factory BuyerModel.fromJson(String source) =>
      BuyerModel.fromMap(json.decode(source) as Map<String, dynamic>);
   */
}
