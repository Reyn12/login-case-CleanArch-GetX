import 'package:dartz/dartz.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasources/login_remote_data_source.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;

  LoginRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<String, LoginEntity>> login(
    String email,
    String password,
  ) async {
    try {
      print('DEBUG: Manggil remoteDataSource.login'); // <--- debug

      final result = await remoteDataSource.login(email, password);
      print('DEBUG: Hasil dari remoteDataSource.login: $result'); // <--- debug
      return Right(result);
    } catch (e) {
      print('DEBUG: Error di repository: $e'); // <--- debug
      return Left(e.toString().replaceAll('Exception: ', ''));
    }
  }
}
