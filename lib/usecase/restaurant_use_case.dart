import 'package:injectable/injectable.dart';
import 'package:tybatest/models/restaurants_response.dart';
import 'package:tybatest/repositories/restaurant_repository.dart';

mixin RestaurantUseCase {
  Future<RestaurantsResponse?> doSearch(String restaurant);

  Future<List<String>> getSearchHistory();
}

@Injectable(as: RestaurantUseCase)
class RestaurantUseCaseAdapter implements RestaurantUseCase {
  final RestaurantRepository _repository;

  RestaurantUseCaseAdapter(this._repository);
  @override
  Future<RestaurantsResponse?> doSearch(String restaurant) {
    return _repository.doSearch(restaurant);
  }

  @override
  Future<List<String>> getSearchHistory() {
    return _repository.getSearchHistory();
  }
}
