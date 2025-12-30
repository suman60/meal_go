import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../network/api_client.dart';
import '../repository/auth_repository.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    final apiClient = ApiClient(baseUrl: "http://94015728a6e3.ngrok-free.app");
    final authRepo = AuthRepository(apiClient);
    Get.put(AuthController(authRepo));
  }
}
