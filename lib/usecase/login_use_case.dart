import 'package:injectable/injectable.dart';
import 'package:tybatest/repositories/login_repository.dart';

mixin LoginUseCase {
  Future<bool> doLogin(String email, String password);
  Future<bool> registerUser(String email, String password);

  Future<bool> isLogged();

  Future<bool> doLogout();
}

@Injectable(as: LoginUseCase)
class LoginUseCaseAdapter implements LoginUseCase {
  final LoginRepository _repository;

  LoginUseCaseAdapter(this._repository);
  @override
  Future<bool> doLogin(String email, String password) {
    return _repository.doLogin(email, password);
  }

  @override
  Future<bool> registerUser(String email, String password) {
    return _repository.registerUser(email, password);
  }

  @override
  Future<bool> isLogged() {
    return _repository.isLogged();
  }

  @override
  Future<bool> doLogout() {
    return _repository.doLogout();
  }
}
