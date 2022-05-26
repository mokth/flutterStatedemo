import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../userrepotory.dart';
import './authevent.dart';
import './authstate.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository? userRepository;

  AuthenticationBloc({@required this.userRepository})
      : assert(userRepository != null),
        super(AuthenticationUninitialized()) {
    //4-Jan-2022
    //upgraded to Bloc 8.0 new way to emit state

    on<AppStarted>((event, emit) {
      emit(AuthenticationUninitialized());
    });

    on<CheckAuth>((event, emit) async {
      final String hasToken = await userRepository!.getTokenOnly();
      userRepository?.authToken = "";
      //print("hasToken " + hasToken.length.toString());

      if (hasToken != "") {
        if (userRepository?.decodeToken(hasToken) == 0) {
          userRepository?.authToken = hasToken;
          emit(AuthenticationAuthenticated());
        } else {
          userRepository?.deleteToken();
          emit(AuthenticationUnauthenticated());
        }
      } else {
        emit(AuthenticationUnauthenticated());
      }
    });

    on<LoggedIn>((event, emit) async {
      emit(AuthenticationLoading());
      await userRepository?.persistToken(event.token!);
      userRepository?.authToken = event.token!;
      emit(AuthenticationAuthenticated());
    });

    on<LoggedOut>((event, emit) async {
      userRepository?.authToken = "";
      emit(AuthenticationLoading());
      userRepository!.deleteToken();
      emit(AuthenticationUnauthenticated());
    });
  }
}

    

  // //@override .. not using
  // AuthenticationState get initialState => AuthenticationUninitialized();

  // Stream<AuthenticationState> mapEventToState(
  //   AuthenticationEvent event,
  // ) async* {
  //   //print("event " + event.toString());

  //   if (event is AppStarted) {
  //     yield AuthenticationUninitialized();
  //   }

  //   if (event is CheckAuth) {
  //     //print('event is CheckAuth');
  //     final String hasToken = await userRepository.getTokenOnly();
  //     userRepository.authToken = "";
  //     //print("hasToken " + hasToken.length.toString());
  //     if (hasToken != "") {
  //       if (userRepository.decodeToken(hasToken) == 0) {
  //         userRepository.authToken = hasToken;
  //         yield AuthenticationAuthenticated();
  //       } else {
  //         await userRepository.deleteToken();
  //         yield AuthenticationUnauthenticated();
  //       }
  //     } else {
  //       yield AuthenticationUnauthenticated();
  //     }
  //   }

  //   if (event is LoggedIn) {
  //     yield AuthenticationLoading();
  //     await userRepository.persistToken(event.token);
  //     userRepository.authToken = event.token;
  //     yield AuthenticationAuthenticated();
  //   }

  //   if (event is LoggedOut) {
  //     userRepository.authToken = "";
  //     yield AuthenticationLoading();
  //     await userRepository.deleteToken();
  //     yield AuthenticationUnauthenticated();
  //   }
  // }
//}
