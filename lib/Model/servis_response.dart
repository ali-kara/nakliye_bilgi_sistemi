class ServisResponse<T> {
  String? message;
  bool success = true;
  T? data;

  ServisResponse({this.message, this.success = true, this.data});
}

class ServisResponseList<T> {
  String? message;
  bool? success;
  List<T>? data;

  ServisResponseList({this.message, this.success, this.data});
}
