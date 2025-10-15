class ApiErrorModel {
  final String? message;
  final int? code;

  ApiErrorModel({
    required this.message,
    this.code,
  });

  // ✅ fromJson
  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      message: json['message'] as String?,
      code: json['code'] as int?,
    );
  }

  // ✅ toJson
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'code': code,
    };
  }
}
