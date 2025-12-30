class LoginResponseModel {
  final String message;
  final String accessToken;
  final String refreshToken;

  LoginResponseModel({
    required this.message,
    required this.accessToken,
    required this.refreshToken,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      message: json['message'] ?? '',
      accessToken: json['access'] ?? '',
      refreshToken: json['refresh'] ?? '',
    );
  }
}
