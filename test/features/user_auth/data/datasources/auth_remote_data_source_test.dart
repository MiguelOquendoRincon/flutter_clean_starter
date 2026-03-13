import 'package:flutter_clean_starter/features/user_auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_clean_starter/features/user_auth/data/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AuthRemoteDataSourceImpl dataSource;

  setUp(() {
    dataSource = AuthRemoteDataSourceImpl();
  });

  group('login', () {
    const tEmail = 'test@test.com';
    const tPassword = '123456';
    const tUserModel = UserModel(
      id: "1",
      email: "test@test.com",
      name: "User Test",
    );

    test(
      'debe retornar UserModel cuando las credenciales son correctas',
      () async {
        // Act
        final result = await dataSource.login(tEmail, tPassword);

        // Assert
        expect(result, tUserModel);
      },
    );

    test(
      'debe lanzar Exception cuando las credenciales son incorrectas',
      () async {
        // Act
        final call = dataSource.login('wrong@test.com', 'wrong');

        // Assert
        expect(() => call, throwsA(isA<Exception>()));
      },
    );
  });
}
