import '../../domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  const LoginModel({required super.token});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(token: json['token'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'token': token};
  }
}
