import 'dart:convert';

GasStation gasStationFromJson(String str) => GasStation.fromJson(json.decode(str));

String gasStationToJson(GasStation data) => json.encode(data.toJson());

class GasStation {
  final String? id;
  final String? name;
  final String? brand;
  final String? street;
  final String? place;
  final double? lat;
  final double? lng;
  final double? dist;
  final double? diesel;
  final double? e5;
  final double? e10;
  final bool? isOpen;
  final String? houseNumber;
  final int? postCode;

  GasStation({
    this.id,
    this.name,
    this.brand,
    this.street,
    this.place,
    this.lat,
    this.lng,
    this.dist,
    this.diesel,
    this.e5,
    this.e10,
    this.isOpen,
    this.houseNumber,
    this.postCode,
  });

  GasStation copyWith({
    String? id,
    String? name,
    String? brand,
    String? street,
    String? place,
    double? lat,
    double? lng,
    double? dist,
    double? diesel,
    double? e5,
    double? e10,
    bool? isOpen,
    String? houseNumber,
    int? postCode,
  }) =>
      GasStation(
        id: id ?? this.id,
        name: name ?? this.name,
        brand: brand ?? this.brand,
        street: street ?? this.street,
        place: place ?? this.place,
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
        dist: dist ?? this.dist,
        diesel: diesel ?? this.diesel,
        e5: e5 ?? this.e5,
        e10: e10 ?? this.e10,
        isOpen: isOpen ?? this.isOpen,
        houseNumber: houseNumber ?? this.houseNumber,
        postCode: postCode ?? this.postCode,
      );

  factory GasStation.fromJson(Map<String, dynamic> json) => GasStation(
    id: json["id"],
    name: json["name"],
    brand: json["brand"],
    street: json["street"],
    place: json["place"],
    lat: json["lat"]?.toDouble(),
    lng: json["lng"]?.toDouble(),
    dist: json["dist"]?.toDouble(),
    diesel: json["diesel"]?.toDouble(),
    e5: json["e5"]?.toDouble(),
    e10: json["e10"]?.toDouble(),
    isOpen: json["isOpen"],
    houseNumber: json["houseNumber"],
    postCode: json["postCode"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "brand": brand,
    "street": street,
    "place": place,
    "lat": lat,
    "lng": lng,
    "dist": dist,
    "diesel": diesel,
    "e5": e5,
    "e10": e10,
    "isOpen": isOpen,
    "houseNumber": houseNumber,
    "postCode": postCode,
  };
}