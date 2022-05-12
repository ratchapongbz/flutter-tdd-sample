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

  @override
  List<Object?> get props => [message, type];
}
