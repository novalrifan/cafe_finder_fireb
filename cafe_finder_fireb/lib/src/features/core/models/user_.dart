// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class TUser extends Equatable {
  final String id;
  final String? name;
  final String? email;
  final String? photo;
  const TUser({
    required this.id,
    this.name,
    this.email,
    this.photo,
  });
  static const empty = TUser(id: '');
  bool get isEmpty => this == TUser.empty;
  bool get isNotEmpty => this != TUser.empty;

  @override
  List<Object?> get props => [id, name, email, photo];
}
