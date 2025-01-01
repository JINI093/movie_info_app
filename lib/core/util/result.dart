sealed class Result<T> {
  const Result();

  get data => null;
}

class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

class Error<T> extends Result<T> {
  final String message;
  final dynamic error;
  const Error({
    required this.message,
    this.error,
  });
}
