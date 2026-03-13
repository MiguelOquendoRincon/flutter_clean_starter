import 'package:flutter_clean_starter/features/user_auth/data/models/user_model.dart';
import 'package:flutter_clean_starter/features/user_auth/domain/entities/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tUserModel = UserModel(
    id: '1',
    email: 'test@test.com',
    name: 'Test User',
  );

  group('UserModel', () {
    test('debe ser una subclase de UserEntity', () {
      expect(tUserModel.toEntity(), isA<UserEntity>());
    });

    test('debe retornar un JSON map válido', () {
      final result = tUserModel.toJson();
      final expectedMap = {
        "id": "1",
        "email": "test@test.com",
        "name": "Test User",
      };
      expect(result, expectedMap);
    });

    test('debe retornar un UserModel válido desde JSON', () {
      final Map<String, dynamic> jsonMap = {
        "id": "1",
        "email": "test@test.com",
        "name": "Test User",
      };
      final result = UserModel.fromJson(jsonMap);
      expect(result, tUserModel);
    });

    test('toEntity debe convertir UserModel a UserEntity correctamente', () {
      final result = tUserModel.toEntity();
      const expectedEntity = UserEntity(
        id: '1',
        email: 'test@test.com',
        name: 'Test User',
      );
      expect(result, expectedEntity);
    });
  });
}
