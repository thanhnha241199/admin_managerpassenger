import 'package:admin_managerpassenger/blocs/admin/view/admin.dart';
import 'package:admin_managerpassenger/blocs/login/bloc/login_bloc.dart';
import 'package:admin_managerpassenger/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  final UserRepository userRepository;

  LoginForm({Key key, @required this.userRepository}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFailture) {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(
                'Tài khoản hoặc mật khẩu không chính xác!',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              backgroundColor: Colors.red,
            ));
          }
          if (state is LoginNull) {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(
                'Tài khoản hoặc mật khẩu không được để trống!',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              backgroundColor: Colors.red,
            ));
          }
          if (state is LoginSuccess) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        AdminScreen(userRepository: widget.userRepository)),
                (route) => false);
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(
                'Đăng nhập thành công!',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              backgroundColor: Colors.green,
            ));
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 1.3,
                width: MediaQuery.of(context).size.width / 1.2,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment(1, 0.0),
                              colors: [
                                const Color(0xFFB2EBF2),
                                const Color(0xFF4DD0E1),
                                const Color(0xFF00BCD4),
                                const Color(0xFF00B6064),
                              ],
                              tileMode: TileMode
                                  .repeated, // repeats the gradient over the canvas
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Login Admin",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Image.asset(
                                "assets/image/user.png",
                                height: 300,
                                width: 300,
                              )
                            ],
                          ),
                        )),
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            end: Alignment(0.0, 0.8),
                            colors: [
                              const Color(0xFFB2EBF2),
                              const Color(0xFF4DD0E1),
                              const Color(0xFF00BCD4),
                              const Color(0xFF455A64),
                              const Color(0xFF00BCD4),
                              const Color(0xFF00B6064),
                            ],
                            tileMode: TileMode
                                .repeated, // repeats the gradient over the canvas
                          ),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Username",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height / 20,
                                width: MediaQuery.of(context).size.width / 2.5,
                                margin: EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                    color: Color(0xFFF2F2F2),
                                    borderRadius: BorderRadius.circular(12.0)),
                                child: TextField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                      hintMaxLines: 10,
                                      border: InputBorder.none,
                                      hintText: "Username",
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 24.0,
                                        vertical: 20.0,
                                      )),
                                ),
                              ),
                              Text(
                                "Password",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height / 20,
                                width: MediaQuery.of(context).size.width / 2.5,
                                margin: EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                    color: Color(0xFFF2F2F2),
                                    borderRadius: BorderRadius.circular(12.0)),
                                child: TextField(
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                      hintMaxLines: 10,
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 24.0,
                                        vertical: 20.0,
                                      )),
                                  obscureText: true,
                                ),
                              ),
                              state is LoginLoading
                                  ? Padding(
                                      padding:
                                          const EdgeInsets.only(left: 220.0),
                                      child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              6,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              20,
                                          child: Center(
                                              child:
                                                  CircularProgressIndicator())),
                                    )
                                  : Padding(
                                      padding:
                                          const EdgeInsets.only(left: 220.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          BlocProvider.of<LoginBloc>(context)
                                              .add(LoginButtonPressed(
                                            email: emailController.text,
                                            password: passwordController.text,
                                          ));
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              6,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              20,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            border: Border.all(
                                              color: Colors.black,
                                              width: 2.0,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              12.0,
                                            ),
                                          ),
                                          margin: EdgeInsets.symmetric(
                                            vertical: 10.0,
                                          ),
                                          child: Visibility(
                                            child: Center(
                                              child: Text(
                                                "Login",
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
