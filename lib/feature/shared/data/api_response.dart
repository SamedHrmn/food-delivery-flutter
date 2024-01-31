// ignore_for_file: constant_identifier_names

enum ApiStatus {
  INITIAL,
  LOADING,
  COMPLETED,
  ERROR,
}

class ApiResponse<T> {
  ApiStatus status;
  T? data;
  String? error;

  ApiResponse.init() : status = ApiStatus.INITIAL;
  ApiResponse.loading() : status = ApiStatus.LOADING;
  ApiResponse.completed(this.data) : status = ApiStatus.COMPLETED;
  ApiResponse.error(this.error) : status = ApiStatus.ERROR;
}
