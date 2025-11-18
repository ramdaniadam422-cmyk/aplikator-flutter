class LoginResponse {
  final String? message;
  final Map<String, dynamic>? aplikator;
  final String? token;
  final Map<String, dynamic>? errors;

  LoginResponse({this.message, this.aplikator, this.token, this.errors});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      message: json['message'],
      aplikator: json['aplikator'] != null ? Map<String, dynamic>.from(json['aplikator']) : null,
      token: json['token'],
      errors: json['errors'] != null ? Map<String, dynamic>.from(json['errors']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'aplikator': aplikator,
      'token': token,
      'errors': errors,
    };
  }
}