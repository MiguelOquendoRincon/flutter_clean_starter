import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_starter/core/errors/failures.dart';
import 'package:flutter_clean_starter/features/user_auth/domain/entities/user_entity.dart';
import 'package:flutter_clean_starter/features/user_auth/domain/usecases/login_usecase.dart';
import 'package:flutter_clean_starter/features/user_auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_clean_starter/features/user_auth/presentation/bloc/auth_event.dart';
import 'package:flutter_clean_starter/features/user_auth/presentation/bloc/auth_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginUseCase extends Mock implements LoginUseCase {}

void main() {
  late AuthBloc bloc;
  late MockLoginUseCase mockLoginUseCase;

  setUp(() {
    mockLoginUseCase = MockLoginUseCase();
    bloc = AuthBloc(mockLoginUseCase);
  });

  const tEmail = "test@test.com";
  const tPassword = "password123";
  const tUser = UserEntity(id: '1', email: tEmail);

  test('el estado inicial debe ser AuthState.initial()', () {
    expect(bloc.state, const AuthState.initial());
  });

  blocTest<AuthBloc, AuthState>(
    'debe emitir [Loading, Authenticated] cuando el login es exitoso',
    build: () {
      when(
        () => mockLoginUseCase(any()),
      ).thenAnswer((_) async => const Right(tUser));
      return bloc;
    },
    act: (bloc) => bloc.add(
      const AuthEvent.loginRequested(email: tEmail, password: tPassword),
    ),
    expect: () => [
      const AuthState.loading(),
      const AuthState.authenticated(tUser),
    ],
  );

  blocTest<AuthBloc, AuthState>(
    'debe emitir [Loading, Error] cuando el login falla',
    build: () {
      when(
        () => mockLoginUseCase(any()),
      ).thenAnswer((_) async => const Left(ServerFailure('Invalid')));
      return bloc;
    },
    act: (bloc) => bloc.add(
      const AuthEvent.loginRequested(email: tEmail, password: tPassword),
    ),
    expect: () => [const AuthState.loading(), const AuthState.error('Invalid')],
  );
}
