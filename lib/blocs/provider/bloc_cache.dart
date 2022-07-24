import 'dart:collection';

import 'package:tybatest/blocs/bloc.dart';

class BlocCache {
  HashMap<String, Bloc> blocs = HashMap<String, Bloc>();
  static final BlocCache _cache = BlocCache._internal();
  BlocCache._internal();

  factory BlocCache() {
    return _cache;
  }

  static Bloc? getBlocInstance(String blocKey, Function? instance) {
    var bloc = BlocCache._cache.blocs[blocKey];
    if (bloc != null) {
      return bloc;
    }
    if (instance != null) {
      bloc = instance();
      BlocCache._cache.blocs[blocKey] = bloc!;
    }
    return bloc;
  }

  static void dispose(String blocKey) {
    BlocCache._cache.blocs[blocKey]?.dispose();
    BlocCache._cache.blocs.removeWhere((key, value) => blocKey == key);
  }
}
