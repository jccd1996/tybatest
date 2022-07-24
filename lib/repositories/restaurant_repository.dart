import 'package:injectable/injectable.dart';
import 'package:tybatest/models/restaurants_response.dart';
import 'package:tybatest/services/api/restaurant_api.dart';
import 'package:tybatest/services/local_storage/user_search_history.dart';

mixin RestaurantRepository {
  Future<RestaurantsResponse?> doSearch(String restaurant);

  Future<List<String>> getSearchHistory();
}

@Injectable(as: RestaurantRepository)
class RestaurantRepositoryAdapter implements RestaurantRepository {
  final RestaurantApi _api;
  final UserSearchHistoryDB _userSearchHistory;
  RestaurantRepositoryAdapter(this._api, this._userSearchHistory);

  @override
  Future<RestaurantsResponse?> doSearch(String restaurant) async {
    await _userSearchHistory.saveSearchHistoryWord(restaurant);
    return _api.doSearch(restaurant);
  }

  @override
  Future<List<String>> getSearchHistory() {
    return _userSearchHistory.getSearchHistory();
  }
}
