import 'package:get/get.dart';
import 'package:meal_go/model/login_response_model.dart';
import '../model/user_model.dart';
import '../repository/auth_repository.dart';
import '../config/routes/app_routes.dart';

class AuthController extends GetxController {
  final AuthRepository _repository;

  AuthController(this._repository);

  final isLoading = false.obs;
  final Rxn<LoginResponseModel> currentUser = Rxn<LoginResponseModel>();

  Future<void> signUp(String fullName, String email, String password, String phone) async {
    if (fullName.isEmpty || email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "All fields are required");
      return;
    }

    try {
      isLoading.value = true;
      final user = await _repository.signUp(fullName, email, password, phone);
      print(user);
      // currentUser.value = user;
      Get.toNamed(AppRoutes.otpVerify, arguments: {'email': email});
    } catch (e) {
      Get.snackbar("Signup Failed", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Future<void> verifyOtp(String email, String otp) async {
  //   if (otp.isEmpty) {
  //     Get.snackbar("Error", "OTP is required");
  //     return;
  //   }

  //   try {
  //     isLoading.value = true;
  //     final user = await _repository.verifyOtp(email, otp);
  //     currentUser.value = user;
  //     Get.offAllNamed(AppRoutes.home);
  //   } catch (e) {
  //     Get.snackbar("OTP Verification Failed", e.toString());
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  Future<void> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Email and password are required");
      return;
    }

    try {
      isLoading.value = true;

      final user = await _repository.login(email, password);
      currentUser.value = user;
      // ✅ Direct login → Home
      Get.offAllNamed(AppRoutes.home);
    } catch (e) {
      Get.snackbar("Login Failed", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
