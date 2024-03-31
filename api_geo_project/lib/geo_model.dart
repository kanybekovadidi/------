// ignore_for_file: public_member_api_docs, sort_constructors_first
class GeoModel {
  GeoModel({
    required this.ip,
    required this.city,
    required this.region,
    required this.country,
    required this.loc,
    required this.org,
    required this.postal,
    required this.timezone,
    required this.readme,
  });
  final String ip;
  final String city;
  final String region;
  final String country;
  final String loc;
  final String org;
  final String postal;
  final String timezone;
  final String readme;

  factory GeoModel.fromJson(Map<String, dynamic> json) {
    return GeoModel(
      ip: json["ip"],
      city: json["city"],
      region: json["region"],
      country: json["country"],
      loc: json["loc"],
      org: json["org"],
      postal: json["postal"],
      timezone: json["timezone"],
      readme: json["readme"],
    );
  }
}
