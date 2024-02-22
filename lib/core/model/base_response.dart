class BaseResponse<T> {
  final bool status;
  final String? message;
  final T? data;

  BaseResponse({this.data, this.message, required this.status});

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
      status: json['success'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] ?? {});

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = status;
    data['message'] = message;
    data['data'] = this.data;
    return data;
  }
}
