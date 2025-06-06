import 'package:dartz/dartz.dart';
import '../entities/login_entity.dart';

abstract class LoginRepository {
  Future<Either<String, LoginEntity>> login(String email, String password);
}
