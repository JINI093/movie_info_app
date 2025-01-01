import '../error/failures.dart';

sealed class Result<T> {
  const Result();

  get data => null;

  get results => null;
}

class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

class Error<T> extends Result<T> {
  final Failure failure;
  const Error(this.failure);
}
