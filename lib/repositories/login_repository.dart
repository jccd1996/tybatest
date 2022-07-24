import 'package:injectable/injectable.dart';
import 'package:tybatest/services/api/login_api.dart';

mixin LoginRepository {
  Future<bool> doLogin(String email, String password);
  Future<bool> registerUser(String email, String password);

  Future<bool> isLogged();

  Future<bool> doLogout();
}

@Injectable(as: LoginRepository)
class LoginRepositoryAdapter implements LoginRepository {
  final LoginApi _api;

  LoginRepositoryAdapter(this._api);
  @override
  Future<bool> doLogin(String email, String password) {
    return _api.doLogin(email, password);
  }

  @override
  Future<bool> registerUser(String email, String password) {
    return _api.registerUser(email, password);
  }

  @override
  Future<bool> isLogged() {
    return _api.isLogged();
  }

  @override
  Future<bool> doLogout() {
    return _api.doLogout();
  }
}
