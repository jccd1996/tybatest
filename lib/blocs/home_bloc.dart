import 'package:injectable/injectable.dart';
import 'package:tybatest/blocs/bloc.dart';
import 'package:tybatest/models/restaurants_response.dart';
import 'package:tybatest/usecase/login_use_case.dart';
import 'package:tybatest/usecase/restaurant_use_case.dart';

@injectable
class HomeBloc implements Bloc {
  final RestaurantUseCase _restaurantUseCase;
  final LoginUseCase _loginUseCase;

  HomeBloc(this._restaurantUseCase, this._loginUseCase);

  Future<RestaurantsResponse?> doSearch(String text) async {
    var result = await _restaurantUseCase.doSearch(text);
    for (var element in result!.result!) {
      print(element.name);
    }
    return _restaurantUseCase.doSearch(text);
  }

  Future<bool> doLogout() async {
    return _loginUseCase.doLogout();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
