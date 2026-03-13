import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.loginRequested({
    required String email,
    required String password,
  }) = _LoginRequested;

  const factory AuthEvent.logoutRequested() = _LogoutRequested;
}
