import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'features/login/data/datasources/login_remote_data_source.dart';
import 'features/login/data/repositories/login_repository_impl.dart';
import 'features/login/domain/usecases/login_usecase.dart';
import 'features/login/presentation/controllers/login_controller.dart';
import 'features/login/presentation/pages/login_page.dart';

void main() {
  // Setup dependency injection
  final httpClient = http.Client();
  final loginRemoteDataSource = LoginRemoteDataSourceImpl(client: httpClient);
  final loginRepository = LoginRepositoryImpl(
    remoteDataSource: loginRemoteDataSource,
  );
  final loginUseCase = LoginUseCase(loginRepository);

  // Register controller
  Get.put(LoginController(loginUseCase: loginUseCase));

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Login App',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: LoginPage(),
    );
  }
}
