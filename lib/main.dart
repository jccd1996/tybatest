import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tybatest/assets/tyba_colors.dart';
import 'package:tybatest/dependency_injections/injection_get_it.dart';
import 'package:tybatest/pages/splash/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tyba test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        iconTheme: IconThemeData(
          color: TybaColors.MAIN_GREEN, //change your color here
        ),
      ),
      home: const SplashPage(),
    );
  }
}
