import 'package:dio/dio.dart';
import 'package:restaurant_search_v5/model/restaurant_response.dart';

class RestaurantsRepository {
  static String mainUrl = "https://restaurant-api.dicoding.dev/";
  final Dio _dio = Dio();

  var getListUrl = '$mainUrl/list';
  var getSearchUrl = '$mainUrl/search';
  var getDetailUrl = '$mainUrl/detail';

  Future<RestaurantResponse> getListRestaurants() async {
    //var params = {"apiKey": apiKey, "language": "en", "country": "us"};
    try {
      // Response response =
      //     await _dio.get(getSourcesUrl, queryParameters: params);
      Response response = await _dio.get(getListUrl);
      return RestaurantResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return RestaurantResponse.withError("$error");
    }
  }
}