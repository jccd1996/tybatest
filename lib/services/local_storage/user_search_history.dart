import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin UserSearchHistoryDB {
  Future<void> saveSearchHistoryWord(String city);
  Future<List<String>> getSearchHistory();
}

@Injectable(as: UserSearchHistoryDB)
class RestaurantRepositoryAdapter implements UserSearchHistoryDB {
  static final RESTAURANT_KEY = 'RESTAURANT';
  @override
  Future<void> saveSearchHistoryWord(String restaurant) async {
    final prefs = await SharedPreferences.getInstance();
    var searchHistory = await getSearchHistory();
    searchHistory.add(restaurant);
    await prefs.setStringList(RESTAURANT_KEY, searchHistory);
    return;
  }

  @override
  Future<List<String>> getSearchHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final items = prefs.getStringList(RESTAURANT_KEY);
      return items ?? [];
    } catch (_) {
      return [];
    }
  }
}
