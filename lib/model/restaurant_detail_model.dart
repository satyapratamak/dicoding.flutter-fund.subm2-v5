class RestaurantDetailModel {
  final String id;
  final String name;
  final String description;
  final String thumbnail;
  final String city;
  final String rating;
  final String address;

  RestaurantDetailModel(
    this.id,
    this.name,
    this.description,
    this.thumbnail,
    this.city,
    this.rating,
    this.address,
  );

  RestaurantDetailModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        description = json["description"],
        thumbnail = "https://restaurant-api.dicoding.dev/images/small/" +
            json["pictureId"],
        city = json["city"],
        rating = json["rating"].toString(),
        address = json["address"];
}
