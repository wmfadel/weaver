abstract class AppError implements Exception {
  final String message;

  const AppError(this.message);
}

class ServerException implements AppError {
  @override
  final String message;

  const ServerException(this.message);
}

class NetworkException implements AppError {
  @override
  final String message;

  const NetworkException(this.message);
}

class UnAuthorizedException implements AppError {
  @override
  final String message;

  const UnAuthorizedException(this.message);
}

class UserNotFoundException implements AppError {
  @override
  final String message;

  const UserNotFoundException(this.message);
}

class AuthenticationException implements AppError {
  @override
  final String message;

  const AuthenticationException(this.message);
}class DataNotFoundException implements AppError {
  @override
  final String message;

  const DataNotFoundException(this.message);
}
class OperationFailedException implements AppError {
  @override
  final String message;

  const OperationFailedException(this.message);
}

