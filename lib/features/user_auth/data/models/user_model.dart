import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String email,
    String? name,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  // Método de extensión para convertir Modelo a Entidad
  // Esto mantiene el Dominio puro
  const UserModel._();
  UserEntity toEntity() => UserEntity(id: id, email: email, name: name);
}
