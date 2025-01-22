sealed class Result<T> {
  const factory Result.success(T value) = Success._;
  const factory Result.error(Exception error) = Error._;
  const Result();
}

final class Success<T> extends Result<T> {
  final T value;
  const Success._(this.value);

  @override
  String toString() => 'Result<$T>.ok($value)';
}

final class Error<T> extends Result<T> {
  final Exception error;
  const Error._(this.error);

  @override
  String toString() => 'Result<$T>.error($error)';
}
