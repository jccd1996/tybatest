// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../blocs/home_bloc.dart' as _i13;
import '../blocs/login_bloc.dart' as _i10;
import '../blocs/my_profile_bloc.dart' as _i14;
import '../blocs/register_bloc.dart' as _i6;
import '../blocs/splash_bloc.dart' as _i8;
import '../repositories/login_repository.dart' as _i4;
import '../repositories/restaurant_repository.dart' as _i11;
import '../services/api/login_api.dart' as _i3;
import '../services/api/restaurant_api.dart' as _i7;
import '../services/local_storage/user_search_history.dart' as _i9;
import '../usecase/login_use_case.dart' as _i5;
import '../usecase/restaurant_use_case.dart'
    as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.LoginApi>(() => _i3.LoginApiAdapter());
  gh.factory<_i4.LoginRepository>(
      () => _i4.LoginRepositoryAdapter(get<_i3.LoginApi>()));
  gh.factory<_i5.LoginUseCase>(
      () => _i5.LoginUseCaseAdapter(get<_i4.LoginRepository>()));
  gh.factory<_i6.RegisterBloc>(() => _i6.RegisterBloc(get<_i5.LoginUseCase>()));
  gh.factory<_i7.RestaurantApi>(() => _i7.RestaurantApiAdapter());
  gh.factory<_i8.SplashBloc>(() => _i8.SplashBloc(get<_i5.LoginUseCase>()));
  gh.factory<_i9.UserSearchHistoryDB>(() => _i9.RestaurantRepositoryAdapter());
  gh.factory<_i10.LoginBloc>(() => _i10.LoginBloc(get<_i5.LoginUseCase>()));
  gh.factory<_i11.RestaurantRepository>(() => _i11.RestaurantRepositoryAdapter(
      get<_i7.RestaurantApi>(), get<_i9.UserSearchHistoryDB>()));
  gh.factory<_i12.RestaurantUseCase>(
      () => _i12.RestaurantUseCaseAdapter(get<_i11.RestaurantRepository>()));
  gh.factory<_i13.HomeBloc>(() =>
      _i13.HomeBloc(get<_i12.RestaurantUseCase>(), get<_i5.LoginUseCase>()));
  gh.factory<_i14.MyProfileBloc>(() => _i14.MyProfileBloc(
      get<_i5.LoginUseCase>(), get<_i12.RestaurantUseCase>()));
  return get;
}
