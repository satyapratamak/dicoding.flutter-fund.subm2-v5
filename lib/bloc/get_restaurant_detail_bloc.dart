import 'package:restaurant_search_v5/model/restaurant_detail_response.dart';
import 'package:restaurant_search_v5/repository/restaurants_repository.dart';
import 'package:rxdart/rxdart.dart';

class GetRestaurantDetailBloc {
  final RestaurantsRepository _repository = RestaurantsRepository();
  final BehaviorSubject<RestaurantDetailResponse> _subject =
      BehaviorSubject<RestaurantDetailResponse>();

  getDetailRestaurant(String id) async {
    RestaurantDetailResponse response =
        await _repository.getDetailRestaurant(id);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<RestaurantDetailResponse> get subject => _subject;
}

final getRestaurantDetailBloc = GetRestaurantDetailBloc();
