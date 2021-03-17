class RestaurantModel {
  final String id;
  final String name;
  final String description;
  final String thumbnail;
  final String city;
  final String rating;

  RestaurantModel(this.id, this.name, this.description, this.thumbnail,
      this.city, this.rating);

  RestaurantModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        description = json["description"],
        thumbnail = "https://restaurant-api.dicoding.dev/images/small/" +
            json["pictureId"],
        city = json["city"],
        rating = json["rating"].toString();
}
