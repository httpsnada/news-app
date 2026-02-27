class ApiErrors {
  final String message;

  ApiErrors({required this.message});

  factory ApiErrors.fromJson(Map<String, dynamic> json) {
    return ApiErrors(message: json['message'] ?? 'Unknown error');
  }
}
