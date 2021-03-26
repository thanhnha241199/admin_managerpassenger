import 'package:admin_managerpassenger/blocs/authentication/bloc/authentication_bloc.dart';
import 'package:admin_managerpassenger/blocs/login/bloc/login_bloc.dart';
import 'package:admin_managerpassenger/blocs/login/view/login_form.dart';
import 'package:admin_managerpassenger/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  final UserRepository userRepository;

  LoginScreen({Key key, @required this.userRepository}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: widget.userRepository,
          );
        },
        child: LoginForm(userRepository: widget.userRepository),
      ),
    );
  }
}
