import 'package:dio/dio.dart';
import 'package:restaurant_search_v5/model/restaurant_detail_response.dart';
import 'package:restaurant_search_v5/model/restaurant_response.dart';

class RestaurantsRepository {
  static String mainUrl = "https://restaurant-api.dicoding.dev/";
  final Dio _dio = Dio();

  var getListUrl = '$mainUrl/list';
  var getSearchUrl = '$mainUrl/search';
  var getDetailUrl = '$mainUrl/detail/';

  Future<RestaurantResponse> getListRestaurants() async {
    try {
      Response response = await _dio.get(getListUrl);
      return RestaurantResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      //return RestaurantResponse.withError("$error");
      return RestaurantResponse.withError(
          "Please check your internet connection");
    }
  }

  Future<RestaurantDetailResponse> getDetailRestaurant(String id) async {
    try {
      Response response = await _dio.get(getDetailUrl + id);
      return RestaurantDetailResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return RestaurantDetailResponse.withError(
          "Please check your internet connection");
    }
  }

  Future<RestaurantResponse> searchRestaurant(String value) async {
    var params = {"q": value};

    try {
      Response response = await _dio.get(getSearchUrl, queryParameters: params);
      return RestaurantResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      if (error is DioError) {
        //handle DioError here by error type or by error code
        print(error.response.statusCode);
      } else {
        print("Exception occured: $error stackTrace: $stacktrace");
        return RestaurantResponse.withError(
            "Please check your internet connection");
      }
    }
  }
}
