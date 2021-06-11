import 'package:admin_managerpassenger/blocs/authentication/bloc/authentication_bloc.dart';
import 'package:admin_managerpassenger/repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null),
        super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent loginEvent,
  ) async* {
    if (loginEvent is LoginButtonPressed) {
      yield LoginLoading();
      if (loginEvent.email.isEmpty || loginEvent.password.isEmpty) {
        yield LoginNull();
      } else {
        try {
          final user = await userRepository.authenticate(
            username: loginEvent.email,
            password: loginEvent.password,
          );
          SharedPreferences pref = await SharedPreferences.getInstance();
          String type = pref.getString("type");
          if (type == "2") {
            authenticationBloc.add(LoggedIn(user: user));
            yield LoginSuccess();
          } else {
            yield LoginFailture(error: "error");
          }
        } catch (error) {
          yield LoginFailture(error: error.toString());
        }
      }
    }
  }
}
