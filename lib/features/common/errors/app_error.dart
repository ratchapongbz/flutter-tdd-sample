import 'package:equatable/equatable.dart';

enum AppErrorType {
  unknown,
  nullValue,
  unAuthorized,
}

class AppError extends Equatable {
  final String message;
  final AppErrorType type;

  const AppError({
    required this.message,
    required this.type,
  });

  factory AppError.nullValue(String message) => AppError(message: message, type: AppErrorType.nullValue);

  factory AppError.unAuthorized(String message) => AppError(message: message, type: AppErrorType.unAuthorized);

  @override
  List<Object?> get props => [message, type];
}
