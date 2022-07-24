import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:tybatest/dependency_injections/injection_get_it.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
void configureDependencies() => $initGetIt(getIt);
