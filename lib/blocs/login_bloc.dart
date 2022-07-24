import 'package:injectable/injectable.dart';
import 'package:tybatest/blocs/bloc.dart';
import 'package:tybatest/usecase/login_use_case.dart';

@injectable
class LoginBloc implements Bloc {
  final LoginUseCase _loginUseCase;
  LoginBloc(this._loginUseCase);

  Future<bool> doLogin(String email, String password) async {
    return await _loginUseCase.doLogin(email, password);
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
