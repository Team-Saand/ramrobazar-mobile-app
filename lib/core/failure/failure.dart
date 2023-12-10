class Failure {
  bool success;
  String timestamp;
  String path;
  dynamic error;

  Failure({
    required this.success,
    required this.timestamp,
    required this.path,
    required this.error,
  });

  factory Failure.fromJson(Map<String, dynamic> json) {
    return Failure(
      success: json['success'] ?? false,
      timestamp: json['timestamp'] ?? '',
      path: json['path'] ?? '',
      error: json['error'] is Map
          ? ErrorDetails.fromJson(json['error'])
          : json['error'],
    );
  }
}

class ErrorDetails {
  String message;
  String error;
  int statusCode;

  ErrorDetails({
    required this.message,
    required this.error,
    required this.statusCode,
  });

  factory ErrorDetails.fromJson(Map<String, dynamic> json) {
    return ErrorDetails(
      message: json['message'] ?? '',
      error: json['error'] ?? '',
      statusCode: json['statusCode'] ?? 0,
    );
  }
}
