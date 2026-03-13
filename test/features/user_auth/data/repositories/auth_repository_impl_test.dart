import 'package:dartz/dartz.dart';
import 'package:flutter_clean_starter/core/errors/failures.dart';
import 'package:flutter_clean_starter/features/user_auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_clean_starter/features/user_auth/data/models/user_model.dart';
import 'package:flutter_clean_starter/features/user_auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_clean_starter/features/user_auth/domain/entities/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

void main() {
  late AuthRepositoryImpl repository;
  late MockAuthRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockAuthRemoteDataSource();
    repository = AuthRepositoryImpl(mockRemoteDataSource);
  });

  const tEmail = 'test@test.com';
  const tPassword = 'password123';
  const tUserModel = UserModel(id: '1', email: tEmail, name: 'Test User');
  const tUserEntity = UserEntity(id: '1', email: tEmail, name: 'Test User');

  group('login', () {
    test(
      'debe retornar UserEntity cuando la llamada al data source es exitosa',
      () async {
        // Arrange
        when(
          () => mockRemoteDataSource.login(any(), any()),
        ).thenAnswer((_) async => tUserModel);

        // Act
        final result = await repository.login(tEmail, tPassword);

        // Assert
        expect(result, const Right(tUserEntity));
        verify(() => mockRemoteDataSource.login(tEmail, tPassword)).called(1);
      },
    );

    test(
      'debe retornar ServerFailure cuando la llamada al data source falla',
      () async {
        // Arrange
        when(
          () => mockRemoteDataSource.login(any(), any()),
        ).thenThrow(Exception('Server Error'));

        // Act
        final result = await repository.login(tEmail, tPassword);

        // Assert
        expect(result, const Left(ServerFailure('Exception: Server Error')));
        verify(() => mockRemoteDataSource.login(tEmail, tPassword)).called(1);
      },
    );
  });
}
