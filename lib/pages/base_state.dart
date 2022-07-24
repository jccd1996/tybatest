import 'package:flutter/material.dart';
import 'package:tybatest/blocs/bloc.dart';
import 'package:tybatest/blocs/provider/provider.dart';
import 'package:tybatest/dependency_injections/injection_get_it.dart';

abstract class BaseState<T extends StatefulWidget, K extends Bloc>
    extends State<T> {
  K? bloc;
//  late AppLocalizations lang;

  @override
  void initState() {
    super.initState();
    bloc = Provider.of<K>(() => getIt.get<K>());
  }

  void dispose() {
    Provider.dispose<K>();
    super.dispose();
  }
}
