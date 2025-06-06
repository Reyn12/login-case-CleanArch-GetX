import 'package:get/get.dart';
import '../../domain/usecases/login_usecase.dart';

class LoginController extends GetxController {
  final LoginUseCase loginUseCase;

  LoginController({required this.loginUseCase});

  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    errorMessage.value = '';

    print('DEBUG: Mulai login, email: $email'); // <--- debug

    final result = await loginUseCase.execute(email, password);

    print('DEBUG: Hasil dari usecase: $result'); // <--- debug

    result.fold(
      (error) {
        print('DEBUG: Error login: $error'); // <--- debug
        errorMessage.value = error;
        Get.snackbar('Login Gagal', error, snackPosition: SnackPosition.BOTTOM);
      },
      (data) {
        print('DEBUG: Login sukses, token: ${data.token}'); // <--- debug
        Get.snackbar(
          'Login Berhasil',
          'Token: ${data.token}',
          snackPosition: SnackPosition.BOTTOM,
        );
      },
    );

    isLoading.value = false;
  }
}
