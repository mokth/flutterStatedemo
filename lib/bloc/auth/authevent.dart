import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

// AppStarted will be dispatched when the Flutter application first loads. It will notify bloc that it needs to determine whether or not there is an existing user.
// LoggedIn will be dispatched on a successful login. It will notify the bloc that the user has successfully logged in.
// LoggedOut will be dispatched on a successful logout. It will notify the bloc that the user has successfully logged out.

abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const []]) : super();
  List<Object> get props => props;
}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'AppStarted';
}

class CheckAuth extends AuthenticationEvent {
  @override
  String toString() => 'CheckAuth';
}

class LoggedIn extends AuthenticationEvent {
  final String? token;

  LoggedIn(this.token) : super([token]);

  @override
  String toString() => 'LoggedIn { token: $token }';
}

class LoggedOut extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';
}
