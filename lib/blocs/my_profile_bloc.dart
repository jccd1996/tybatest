import 'package:injectable/injectable.dart';
import 'package:tybatest/blocs/bloc.dart';
import 'package:tybatest/usecase/login_use_case.dart';
import 'package:tybatest/usecase/restaurant_use_case.dart';

@injectable
class MyProfileBloc implements Bloc {
  final LoginUseCase _loginUseCase;
  final RestaurantUseCase _restaurantUseCase;
  MyProfileBloc(this._loginUseCase, this._restaurantUseCase);

  Future<bool> doLogout() async {
    return await _loginUseCase.doLogout();
  }

  Future<List<String>> getSearchHistory() {
    return _restaurantUseCase.getSearchHistory();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
