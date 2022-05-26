import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import '../userrepotory.dart';
import 'login_state.dart';
import 'login_event.dart';
import '../../bloc/auth/authevent.dart';
import '../../bloc/auth/authbloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository? userRepository;
  final AuthenticationBloc? authenticationBloc;

  LoginBloc(
    this.userRepository,
    this.authenticationBloc,
  )   : assert(userRepository != null),
        assert(authenticationBloc != null),
        super(LoginInitial()) {
    //4-Jan-2022
    //upgraded to Bloc 8.0 new way to emit state
    on<LoginButtonPressed>((event, emit) async {
      userRepository?.authToken = "";
      emit(LoginLoading());
      await Future.delayed(Duration(seconds: 3));
      try {
        final String token = await userRepository!
            .authenticate(event.username!, event.password!, event.compCode!);
        List<String> resp = token.split('|');
        if (resp[0] != "") {
          authenticationBloc!.add(LoggedIn(resp[0]));
          emit(LoginInitial());
        } else {
          emit(LoginFailure(resp[1]));
        }
      } catch (error) {
        emit(LoginFailure(error.toString()));
      }
    });
  }
}

//   LoginState get initialState => LoginInitial();

//   @override
//   Stream<LoginState> mapEventToState(LoginEvent event) async* {
//     if (event is LoginButtonPressed) {
//       yield LoginLoading();

//       try {
//         final String token = await userRepository.authenticate(
//             username: event.username,
//             password: event.password,
//             compCode: event.compCode);
//         List<String> resp = token.split('|');
//         if (resp[0] != "") {
//           authenticationBloc.add(LoggedIn(token: resp[0]));
//           yield LoginInitial();
//         } else {
//           yield LoginFailure(error: resp[1]);
//         }
//       } catch (error) {
//         yield LoginFailure(error: error.toString());
//       }
//     }
//   }
// }
