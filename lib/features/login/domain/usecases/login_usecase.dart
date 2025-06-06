import 'package:dartz/dartz.dart';
import '../entities/login_entity.dart';
import '../repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  Future<Either<String, LoginEntity>> execute(String email, String password) {
    return repository.login(email, password);
  }
}
