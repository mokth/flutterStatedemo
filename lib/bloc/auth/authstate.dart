import 'package:equatable/equatable.dart';

// uninitialized   — waiting to see if the user is authenticated or not on app start.
// loading         — waiting to persist/delete a token
// authenticated   — successfully authenticated
// unauthenticated — not authenticated

abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props => <Object>[];
}

class AuthenticationUninitialized extends AuthenticationState {
  @override
  String toString() => 'AuthenticationUninitialized';
}

class AuthenticationAuthenticated extends AuthenticationState {
  @override
  String toString() => 'AuthenticationAuthenticated';
}

class AuthenticationUnauthenticated extends AuthenticationState {
  @override
  String toString() => 'AuthenticationUnauthenticated';
}

class AuthenticationLoading extends AuthenticationState {
  @override
  String toString() => 'AuthenticationLoading';
}
