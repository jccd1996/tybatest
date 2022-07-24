import 'package:flutter/material.dart';
import 'package:tybatest/assets/tyba_colors.dart';
import 'package:tybatest/blocs/register_bloc.dart';
import 'package:tybatest/pages/base_state.dart';
import 'package:tybatest/widgets/tyba_outlined_button.dart';
import 'package:tybatest/widgets/tyba_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends BaseState<RegisterPage, RegisterBloc> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Registro',
                      style: TextStyle(
                          color: TybaColors.MAIN_GREEN, fontSize: 40.0),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Column(
                    children: [
                      TybaTextField(
                        controller: _nameController,
                        icon: Icons.person,
                        labelText: 'Nombre completo *',
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
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
                        icon: Icons.lock,
                        labelText: 'Email *',
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TybaTextField(
                        controller: _repeatPasswordController,
                        icon: Icons.lock_clock,
                        labelText: 'Repetir contraseña *',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  TybaOutlinedButton(
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        "CREAR CUENTA",
                        style: TextStyle(color: TybaColors.MAIN_GREEN),
                      ),
                    ),
                    onPressed: () async {
                      await bloc!.registerUser(
                          _emailController.text, _passwordController.text);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
