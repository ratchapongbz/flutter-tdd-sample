import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  final String id;
  final String name;
  final String areaId;

  const AppUser({
    required this.id,
    required this.name,
    required this.areaId,
  });

  @override
  List<Object?> get props => [id, name, areaId];
}
