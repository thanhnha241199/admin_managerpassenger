import 'dart:async';

import 'package:admin_managerpassenger/blocs/admin/model/user_authenticate.dart';
import 'package:admin_managerpassenger/repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({@required this.userRepository})
      : assert(UserRepository != null),
        super(AuthenticationUninitialized());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      yield AuthenticationUninitialized();
      final bool hasToken = prefs.getString("token") != null ? true : false;
      final String type = prefs.getString("type");
      if (hasToken && type == "0") {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      var prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", event.user.token);
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      var prefs = await SharedPreferences.getInstance();
      await prefs.remove("token");
      yield AuthenticationUnauthenticated();
    }
  }
}
