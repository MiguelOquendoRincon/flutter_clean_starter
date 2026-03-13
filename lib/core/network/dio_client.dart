import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'auth_interceptor.dart'; // Importa el interceptor

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio(AuthInterceptor authInterceptor) {
    // Inyectamos el interceptor aquí
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.tu-servidor.com',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    // Añadimos nuestro interceptor personalizado
    dio.interceptors.addAll([
      authInterceptor,
      LogInterceptor(requestBody: true, responseBody: true),
    ]);

    return dio;
  }
}
