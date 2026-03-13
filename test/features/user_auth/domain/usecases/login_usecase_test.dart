import 'package:dartz/dartz.dart';
import 'package:flutter_clean_starter/core/errors/failures.dart';
import 'package:flutter_clean_starter/features/user_auth/domain/entities/user_entity.dart';
import 'package:flutter_clean_starter/features/user_auth/domain/repositories/auth_repository.dart';
import 'package:flutter_clean_starter/features/user_auth/domain/usecases/login_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Creamos el Mock
class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late LoginUseCase usecase;
  late MockAuthRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthRepository();
    usecase = LoginUseCase(mockRepository);
  });

  const tEmail = "test@test.com";
  const tPassword = "password123";
  const tUserEntity = UserEntity(id: '1', email: tEmail);

  test(
    'debe retornar UserEntity cuando el login en el repositorio es exitoso',
    () async {
      // Arrange (Preparar)
      when(
        () => mockRepository.login(any(), any()),
      ).thenAnswer((_) async => const Right(tUserEntity));

      // Act (Ejecutar)
      final result = await usecase(
        const LoginParams(email: tEmail, password: tPassword),
      );

      // Assert (Verificar)
      expect(result, const Right(tUserEntity));
      verify(() => mockRepository.login(tEmail, tPassword)).called(1);
      verifyNoMoreInteractions(mockRepository);
    },
  );

  test('debe retornar ServerFailure cuando el repositorio falla', () async {
    // Arrange
    when(
      () => mockRepository.login(any(), any()),
    ).thenAnswer((_) async => const Left(ServerFailure('Error de servidor')));

    // Act
    final result = await usecase(
      const LoginParams(email: tEmail, password: tPassword),
    );

    // Assert
    expect(result, const Left(ServerFailure('Error de servidor')));
  });
}
