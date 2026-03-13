import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/login_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;

  AuthBloc(this._loginUseCase) : super(const AuthState.initial()) {
    // CAMBIO AQUÍ: Usamos la clase pública AuthEvent y filtramos por el método map de Freezed
    // o simplemente usamos la referencia correcta si no es privada.
    on<AuthEvent>((event, emit) async {
      await event.when(
        loginRequested: (email, password) =>
            _onLoginRequested(email, password, emit),
        logoutRequested: () => _onLogoutRequested(emit),
      );
    });
  }

  Future<void> _onLoginRequested(
    String email,
    String password,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final result = await _loginUseCase(
      LoginParams(email: email, password: password),
    );

    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (user) => emit(AuthState.authenticated(user)),
    );
  }

  Future<void> _onLogoutRequested(Emitter<AuthState> emit) async {
    // Implementación de logout si fuera necesaria
  }
}
