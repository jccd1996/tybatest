import 'package:flutter/material.dart';
import 'package:tybatest/assets/tyba_images.dart';
import 'package:tybatest/blocs/splash_bloc.dart';
import 'package:tybatest/pages/base_state.dart';
import 'package:tybatest/pages/home/home_page.dart';
import 'package:tybatest/pages/login/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends BaseState<SplashPage, SplashBloc> {
  @override
  void initState() {
    _validateSession();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(TybaImages.LOGO),
          Text(
            'App created by Camilo Cubillos',
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Future<void> _validateSession() async {
    Future.delayed(
      const Duration(seconds: 3),
      () async {
        if (await bloc!.isLogged()) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const HomePage()));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const LoginPage()));
        }
      },
    );
  }
}
