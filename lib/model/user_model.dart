class UserModel {
  final String? id;    
  final String fullName;
  final String email;
  final bool isVerified;  
  final String? token;     

  UserModel({
    this.id,
    required this.fullName,
    required this.email,
    this.isVerified = false,
    this.token,
  });

  // Factory constructor to create a UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id']?.toString(),
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      isVerified: json['isVerified'] ?? false,
      token: json['token'],
    );
  }

  // Convert UserModel to JSON (for sending to API if needed)
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'fullName': fullName,
      'email': email,
      'isVerified': isVerified,
      if (token != null) 'token': token,
    };
  }
}
