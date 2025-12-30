import 'package:meal_go/model/login_request_model.dart';
import 'package:meal_go/model/login_response_model.dart';

import '../network/api_client.dart';
import '../model/user_model.dart';

class AuthRepository {
  final ApiClient _apiClient;

  AuthRepository(this._apiClient);

  Future<UserModel> signUp(
    String fullName,
    String email,
    String password,
  ) async {
    final data = await _apiClient.request(
      endpoint: 'signup',
      method: 'POST',
      body: {'fullName': fullName, 'email': email, 'password': password},
    );
    return UserModel.fromJson(data);
  }

  Future<UserModel> verifyOtp(String email, String otp) async {
    final data = await _apiClient.request(
      endpoint: 'verify-otp',
      method: 'POST',
      body: {'email': email, 'otp': otp},
    );
    return UserModel.fromJson(data);
  }

  Future<LoginResponseModel> login(String email, String password) async {
    final data = await _apiClient.request(
      endpoint: 'api/auth/login',
      method: 'POST',
      body: {'email': email, 'password': password},
    );
    return LoginResponseModel.fromJson(data);
  }
}
