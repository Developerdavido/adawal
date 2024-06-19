

class ErrorResponse {
  int? statusCode;
  String? error;
  String? message;

  ErrorResponse({
    this.statusCode,
    this.error,
    this.message,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
    statusCode: json["status_code"],
    error: json["error"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "error": error,
    "message": message,
  };
}