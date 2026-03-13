// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/network/dio_client.dart' as _i393;
import '../features/user_auth/data/datasources/auth_local_data_source.dart'
    as _i635;
import '../features/user_auth/data/datasources/auth_remote_data_source.dart'
    as _i188;
import '../features/user_auth/data/repositories/auth_repository_impl.dart'
    as _i925;
import '../features/user_auth/domain/repositories/auth_repository.dart'
    as _i425;
import '../features/user_auth/domain/usecases/login_usecase.dart' as _i838;
import '../features/user_auth/presentation/bloc/auth_bloc.dart' as _i596;
import 'storage_module.dart' as _i371;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    final storageModule = _$StorageModule();
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio);
    gh.lazySingleton<_i558.FlutterSecureStorage>(() => storageModule.storage);
    gh.lazySingleton<_i635.AuthLocalDataSource>(
      () => _i635.AuthLocalDataSourceImpl(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i188.AuthRemoteDataSource>(
      () => _i188.AuthRemoteDataSourceImpl(),
    );
    gh.lazySingleton<_i425.AuthRepository>(
      () => _i925.AuthRepositoryImpl(gh<_i188.AuthRemoteDataSource>()),
    );
    gh.lazySingleton<_i838.LoginUseCase>(
      () => _i838.LoginUseCase(gh<_i425.AuthRepository>()),
    );
    gh.factory<_i596.AuthBloc>(() => _i596.AuthBloc(gh<_i838.LoginUseCase>()));
    return this;
  }
}

class _$NetworkModule extends _i393.NetworkModule {}

class _$StorageModule extends _i371.StorageModule {}
