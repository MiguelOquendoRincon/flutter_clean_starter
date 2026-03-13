// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../features/user_auth/data/datasources/auth_remote_data_source.dart'
    as _i188;
import '../features/user_auth/data/repositories/auth_repository_impl.dart'
    as _i925;
import '../features/user_auth/domain/repositories/auth_repository.dart'
    as _i425;
import '../features/user_auth/domain/usecases/login_usecase.dart' as _i838;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i188.AuthRemoteDataSource>(
      () => _i188.AuthRemoteDataSourceImpl(),
    );
    gh.lazySingleton<_i425.AuthRepository>(
      () => _i925.AuthRepositoryImpl(gh<_i188.AuthRemoteDataSource>()),
    );
    gh.lazySingleton<_i838.LoginUseCase>(
      () => _i838.LoginUseCase(gh<_i425.AuthRepository>()),
    );
    return this;
  }
}
