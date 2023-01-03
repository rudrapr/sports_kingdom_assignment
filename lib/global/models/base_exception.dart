class BaseException implements Exception {
  String message;

  BaseException({required this.message});

  @override
  String toString() {
    return message;
  }
}
