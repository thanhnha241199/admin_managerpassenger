import 'package:admin_managerpassenger/blocs/admin/bloc/admin_bloc.dart';
import 'package:admin_managerpassenger/blocs/admin/view/admin.dart';
import 'package:admin_managerpassenger/blocs/login/view/login.dart';
import 'package:admin_managerpassenger/blocs/simple_bloc_observer.dart';
import 'package:admin_managerpassenger/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/authentication/bloc/authentication_bloc.dart';
import 'blocs/counter/bloc/counter_bloc.dart';

void main() {
  final userRepository = UserRepository();
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp(userRepository: userRepository));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  MyApp({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                AdminBloc(AdminInitialState(), UserRepository())),
        BlocProvider<AuthenticationBloc>(create: (context) {
          return AuthenticationBloc(userRepository: userRepository)
            ..add(AppStarted());
        })
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is AuthenticationUnauthenticated) {
              return LoginScreen(userRepository: userRepository);
            }
            if (state is AuthenticationAuthenticated) {
              return AdminScreen(userRepository: userRepository);
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
