import 'package:injectable/injectable.dart';
import 'package:tybatest/blocs/bloc.dart';
import 'package:tybatest/usecase/login_use_case.dart';

@injectable
class RegisterBloc implements Bloc {
  final LoginUseCase _loginUseCase;
  RegisterBloc(this._loginUseCase);

  Future<bool> registerUser(String email, String password) async {
    return await _loginUseCase.registerUser(email, password);
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
