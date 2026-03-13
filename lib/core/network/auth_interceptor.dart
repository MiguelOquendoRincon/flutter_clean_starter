import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../features/user_auth/data/datasources/auth_local_data_source.dart';

@injectable
class AuthInterceptor extends Interceptor {
  final AuthLocalDataSource _localDataSource;

  AuthInterceptor(this._localDataSource);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // 1. Recuperamos el token del almacenamiento seguro
    final token = await _localDataSource.getToken();

    // 2. Si existe, lo añadimos a las cabeceras
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    // 3. Continuamos con la petición
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Bonus: Si el servidor responde 401 (Unauthorized),
    // podrías disparar un evento de logout automático aquí.
    if (err.response?.statusCode == 401) {
      // Lógica de logout o refresco de token
    }
    return handler.next(err);
  }
}
