import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../network/api_client.dart';
import '../repository/auth_repository.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    final apiClient = ApiClient(
      baseUrl: "https://cde4691cc561.ngrok-free.app/",
    );
    final authRepo = AuthRepository(apiClient);
    Get.put(AuthController(authRepo));
  }
}
