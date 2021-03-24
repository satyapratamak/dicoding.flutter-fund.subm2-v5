import 'package:restaurant_search_v5/model/restaurant_detail_model.dart';

class RestaurantDetailResponse {
  //final List<RestaurantDetailModel> restoDetail;
  final RestaurantDetailModel restoDetail;
  final String error;

  RestaurantDetailResponse(
    this.restoDetail,
    this.error,
  );

  RestaurantDetailResponse.fromJson(Map<String, dynamic> json)
      : restoDetail = RestaurantDetailModel.fromJson(json["restaurant"]),
        error = "";

  // RestaurantDetailResponse.fromJson(Map<String, dynamic> json)
  //     : restoDetail = json["restaurant"],
  //       error = "";

  // RestaurantDetailResponse.withError(String errorValue)
  //     : restoDetail = [
  //         RestaurantDetailModel(null, null, null, null, null, null, null)
  //       ],
  //       error = errorValue;
  RestaurantDetailResponse.withError(String errorValue)
      : restoDetail =
            RestaurantDetailModel(null, null, null, null, null, null, null),
        error = errorValue;
}
