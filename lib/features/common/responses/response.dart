import 'package:equatable/equatable.dart';
import 'package:flutter_tdd_sample/features/common/errors/app_error.dart';

class Response<T extends Equatable> extends Equatable {
  final T? value;
  final AppError? error;

  const Response({
    this.value,
    this.error,
  });

  @override
  List<Object?> get props => [value, error];
}
