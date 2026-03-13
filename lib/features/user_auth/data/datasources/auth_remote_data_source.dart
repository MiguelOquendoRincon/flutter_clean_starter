import 'package:injectable/injectable.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  // Aquí inyectarías tu cliente Dio
  AuthRemoteDataSourceImpl();

  @override
  Future<UserModel> login(String email, String password) async {
    // Simulando una llamada a API
    await Future.delayed(const Duration(seconds: 1));

    if (email == "test@test.com" && password == "123456") {
      return const UserModel(
        id: "1",
        email: "test@test.com",
        name: "User Test",
      );
    } else {
      throw Exception("Invalid Credentials");
    }
  }
}
