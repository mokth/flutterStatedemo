import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]) : super();
  List<Object> get props => props;
}

class LoginButtonPressed extends LoginEvent {
  final String? username;
  final String? password;
  final String? compCode;

  LoginButtonPressed(this.username, this.password, this.compCode)
      : super([username, password, compCode]);

  @override
  String toString() =>
      'LoginButtonPressed { username: $username, password: $password }';
}
