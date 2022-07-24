import 'package:flutter/material.dart';
import 'package:tybatest/assets/tyba_colors.dart';
import 'package:tybatest/blocs/login_bloc.dart';
import 'package:tybatest/pages/base_state.dart';
import 'package:tybatest/pages/home/home_page.dart';
import 'package:tybatest/pages/register/register_page.dart';
import 'package:tybatest/widgets/tyba_outlined_button.dart';
import 'package:tybatest/widgets/tyba_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage, LoginBloc> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Login - Tyba Prueba',
                  style:
                      TextStyle(color: TybaColors.MAIN_GREEN, fontSize: 40.0),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Column(
                children: [
                  TybaTextField(
                    controller: _emailController,
                    icon: Icons.email,
                    labelText: 'Email *',
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TybaTextField(
                    controller: _passwordController,
                    icon: Icons.email,
                    labelText: 'Contraseña *',
                    obscureText: true,
                  ),
                ],
              ),
              const SizedBox(
                height: 50.0,
              ),
              TybaOutlinedButton(
                onPressed: () async {
                  var result = await bloc!
                      .doLogin(_emailController.text, _passwordController.text);
                  if (result) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute<void>(
                        builder: (_) => const HomePage(),
                      ),
                    );
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.0),
                  child: Text(
                    "LOGIN",
                    style: TextStyle(color: TybaColors.MAIN_GREEN),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  const Text(
                    '¿No tienes una cuenta? ',
                    style: TextStyle(
                      color: TybaColors.MAIN_GREEN,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const RegisterPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Registrate aquí',
                      style: TextStyle(
                          color: TybaColors.MAIN_GREEN,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
