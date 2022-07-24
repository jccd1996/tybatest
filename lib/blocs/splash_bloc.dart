import 'package:injectable/injectable.dart';
import 'package:tybatest/blocs/bloc.dart';
import 'package:tybatest/usecase/login_use_case.dart';

@injectable
class SplashBloc implements Bloc {
  final LoginUseCase _loginUseCase;
  SplashBloc(this._loginUseCase);

  Future<bool> isLogged() async {
    return await _loginUseCase.isLogged();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
