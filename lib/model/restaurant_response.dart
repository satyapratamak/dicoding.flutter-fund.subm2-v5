import 'package:restaurant_search_v5/model/restaurant_model.dart';

class RestaurantResponse {
  final List<RestaurantModel> restaurants;
  final String error;

  RestaurantResponse(this.restaurants, this.error);

  RestaurantResponse.fromJson(Map<String, dynamic> json)
      : restaurants = (json["restaurants"] as List)
            .map((i) => new RestaurantModel.fromJson(i))
            .toList(),
        error = "";

  RestaurantResponse.fromJsonDetail(Map<String, dynamic> json)
      : restaurants = (json["restaurant"] as List)
            .map((i) => new RestaurantModel.fromJson(i))
            .toList(),
        error = "";

  RestaurantResponse.withError(String errorValue)
      : restaurants = List(),
        error = errorValue;
}
