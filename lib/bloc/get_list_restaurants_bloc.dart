import 'package:restaurant_search_v5/model/restaurant_response.dart';
import 'package:restaurant_search_v5/repository/restaurants_repository.dart';
import 'package:rxdart/rxdart.dart';

class GetListRestaurantsBloc {
  final RestaurantsRepository _repository = RestaurantsRepository();
  final BehaviorSubject<RestaurantResponse> _subject =
      BehaviorSubject<RestaurantResponse>();

  getListRestaurants() async {
    RestaurantResponse response = await _repository.getListRestaurants();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<RestaurantResponse> get subject => _subject;
}

final getListRestaurantBloc = GetListRestaurantsBloc();
