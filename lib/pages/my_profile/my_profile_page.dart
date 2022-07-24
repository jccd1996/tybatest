import 'package:flutter/material.dart';
import 'package:tybatest/assets/tyba_colors.dart';
import 'package:tybatest/blocs/my_profile_bloc.dart';
import 'package:tybatest/pages/base_state.dart';
import 'package:tybatest/pages/history/history_page.dart';
import 'package:tybatest/pages/login/login_page.dart';
import 'package:tybatest/widgets/tyba_outlined_button.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends BaseState<MyProfilePage, MyProfileBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        backgroundColor: TybaColors.MAIN_GREEN,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TybaOutlinedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.history_edu_outlined,
                      color: TybaColors.MAIN_GREEN),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Historial de busqueda",
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
              onPressed: () async {
                var result = await bloc!.getSearchHistory();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (_) => HistoryPage(history: result),
                  ),
                );
              },
            ),
            TybaOutlinedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.logout, color: TybaColors.MAIN_GREEN),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Finalizar sesión",
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
              onPressed: () async {
                var result = await bloc!.doLogout();
                if (result) {
                  Navigator.pushAndRemoveUntil<void>(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => const LoginPage()),
                    ModalRoute.withName('/'),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
