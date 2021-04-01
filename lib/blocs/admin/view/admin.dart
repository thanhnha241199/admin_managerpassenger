import 'package:admin_managerpassenger/blocs/account/employee.dart';
import 'package:admin_managerpassenger/blocs/account/user.dart';
import 'package:admin_managerpassenger/blocs/admin/bloc/admin_bloc.dart';
import 'package:admin_managerpassenger/blocs/authentication/bloc/authentication_bloc.dart';
import 'package:admin_managerpassenger/blocs/car/view/car.dart';
import 'package:admin_managerpassenger/blocs/chart/chart_sample1.dart';
import 'package:admin_managerpassenger/blocs/chart/chart_sample2.dart';
import 'package:admin_managerpassenger/blocs/chart/chart_sample8.dart';
import 'package:admin_managerpassenger/blocs/discount/discount.dart';

import 'package:admin_managerpassenger/blocs/login/view/login.dart';
import 'package:admin_managerpassenger/blocs/order/view/order.dart';
import 'package:admin_managerpassenger/blocs/order/view/rental.dart';
import 'package:admin_managerpassenger/blocs/ticket/view/position.dart';
import 'package:admin_managerpassenger/blocs/ticket/view/schedule.dart';
import 'package:admin_managerpassenger/blocs/ticket/view/ticket.dart';
import 'package:admin_managerpassenger/blocs/ticket/view/time.dart';
import 'package:admin_managerpassenger/repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminScreen extends StatefulWidget {
  final UserRepository userRepository;

  AdminScreen({Key key, @required this.userRepository}) : super(key: key);

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  String name;
  String select;
  bool check = false;
  TextEditingController searchController = TextEditingController();

  Future<String> getEmail() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      name = pref.getString("name");
    });
    return name;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    select = "dashboard";
    BlocProvider.of<AdminBloc>(context).add(DoFetchUserEvent());
    getEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationUnauthenticated) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        LoginScreen(userRepository: widget.userRepository)),
                (route) => false);
          }
        },
        child: Container(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/image/user.png",
                            height: 80,
                            width: 80,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(name ?? "No User")
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.dashboard_outlined),
                      title: Text('Dashboard'),
                      onTap: () {
                        setState(() {
                          select = "dashboard";
                        });
                      },
                    ),
                    ExpansionTile(
                      childrenPadding: EdgeInsets.symmetric(horizontal: 10),
                      leading: Icon(Icons.person_outlined),
                      title: Text("Account"),
                      children: [
                        ListTile(
                          leading: Icon(Icons.person_outline),
                          title: Text('User'),
                          onTap: () {
                            setState(() {
                              select = "user";
                            });
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.people_alt_outlined),
                          title: Text('Employee'),
                          onTap: () {
                            setState(() {
                              select = "employee";
                            });
                          },
                        ),
                      ],
                    ),
                    ExpansionTile(
                      childrenPadding: EdgeInsets.symmetric(horizontal: 10),
                      leading: Icon(Icons.money_off_csred_rounded),
                      title: Text("Order"),
                      children: [
                        ListTile(
                          leading: Icon(Icons.topic),
                          title: Text('Ticket'),
                          onTap: () {
                            setState(() {
                              select = "order/ticket";
                            });
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.tab_rounded),
                          title: Text('Rental'),
                          onTap: () {
                            setState(() {
                              select = "order/rental";
                            });
                          },
                        ),
                      ],
                    ),
                    ExpansionTile(
                      childrenPadding: EdgeInsets.symmetric(horizontal: 10),
                      leading: Icon(Icons.ac_unit_rounded),
                      title: Text("Ticket"),
                      children: [
                        ListTile(
                          leading: Icon(Icons.topic),
                          title: Text('Ticket popular'),
                          onTap: () {
                            setState(() {
                              select = "ticket";
                            });
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.tab_rounded),
                          title: Text('Schedule'),
                          onTap: () {
                            setState(() {
                              select = "schedule";
                            });
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.topic),
                          title: Text('Time - Location'),
                          onTap: () {
                            setState(() {
                              select = "time";
                            });
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.tab_rounded),
                          title: Text('Position'),
                          onTap: () {
                            setState(() {
                              select = "position";
                            });
                          },
                        ),
                      ],
                    ),
                    ListTile(
                      leading: Icon(Icons.car_repair),
                      title: Text('Car'),
                      onTap: () {
                        setState(() {
                          select = "car";
                        });
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.card_giftcard),
                      title: Text('Discount'),
                      onTap: () {
                        setState(() {
                          select = "discount";
                        });
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.exit_to_app_outlined),
                      title: Text("Logout"),
                      onTap: () async {
                        BlocProvider.of<AuthenticationBloc>(context)
                            .add(LoggedOut());
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.remove("token");
                        prefs.remove("name");
                        prefs.remove("type");
                      },
                    ),
                  ],
                ),
              ),
              select == "dashboard"
                  ? BlocBuilder<AdminBloc, AdminState>(
                      builder: (context, state) {
                        if (state is FailureState) {
                          return Expanded(
                            flex: 5,
                            child: Text("Error"),
                          );
                        }
                        if (state is LoadingState) {
                          return Expanded(
                            flex: 5,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                        if (state is SuccessState) {
                          return Expanded(
                              flex: 5,
                              child: Container(
                                color: Colors.grey.withOpacity(0.2),
                                child: ListView(
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              18,
                                      width: MediaQuery.of(context).size.width,
                                      color: Colors.white,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0),
                                            child: Text(
                                              "Admin",
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Spacer(),
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                20,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                8,
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 20),
                                            decoration: BoxDecoration(
                                                color: Colors.grey
                                                    .withOpacity(0.3),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        12.0)),
                                            child: TextField(
                                              controller: searchController,
                                              decoration: InputDecoration(
                                                  suffixIcon: IconButton(
                                                      onPressed: () {
                                                        print("search");
                                                      },
                                                      icon: Icon(Icons.search)),
                                                  hintMaxLines: 10,
                                                  border: InputBorder.none,
                                                  hintText: "Search",
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 24.0,
                                                          vertical: 3.0)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              6,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              6.5,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              gradient: LinearGradient(
                                                begin: Alignment.topRight,
                                                end: Alignment.bottomLeft,
                                                stops: [
                                                  0.1,
                                                  0.4,
                                                  0.6,
                                                  0.9,
                                                ],
                                                colors: [
                                                  Colors.yellow,
                                                  Colors.blue,
                                                  Colors.indigo,
                                                  Colors.teal,
                                                ],
                                              )),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                      top: 20.0),
                                                  child: Text(
                                                    "Account",
                                                    style: TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  state.useraccount.length
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 60,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              6,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              6.5,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              gradient: LinearGradient(
                                                begin: Alignment.topRight,
                                                end: Alignment.bottomLeft,
                                                stops: [
                                                  0.1,
                                                  0.4,
                                                  0.6,
                                                  0.9,
                                                ],
                                                colors: [
                                                  Colors.yellow,
                                                  Colors.teal,
                                                  Colors.blue,
                                                  Colors.indigo,
                                                ],
                                              )),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                      top: 20.0),
                                                  child: Text(
                                                    "Ticket",
                                                    style: TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  state.ticket.length
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 60,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              6,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              6.5,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              gradient: LinearGradient(
                                                begin: Alignment.topRight,
                                                end: Alignment.bottomLeft,
                                                stops: [
                                                  0.1,
                                                  0.4,
                                                  0.6,
                                                  0.9,
                                                ],
                                                colors: [
                                                  Colors.yellow,
                                                  Colors.indigo,
                                                  Colors.blue,
                                                  Colors.teal,
                                                ],
                                              )),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                      top: 20.0),
                                                  child: Text(
                                                    "Order",
                                                    style: TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  state.useraccount.length
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 60,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              6,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              6.5,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              gradient: LinearGradient(
                                                begin: Alignment.topRight,
                                                end: Alignment.bottomLeft,
                                                stops: [
                                                  0.1,
                                                  0.4,
                                                  0.6,
                                                  0.9,
                                                ],
                                                colors: [
                                                  Colors.yellow,
                                                  Colors.teal,
                                                  Colors.blue,
                                                  Colors.indigo,
                                                ],
                                              )),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                      top: 20.0),
                                                  child: Text(
                                                    "Car",
                                                    style: TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  state.car.length.toString(),
                                                  style: TextStyle(
                                                    fontSize: 60,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              6,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              6.5,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              gradient: LinearGradient(
                                                begin: Alignment.topRight,
                                                end: Alignment.bottomLeft,
                                                stops: [
                                                  0.1,
                                                  0.4,
                                                  0.6,
                                                  0.9,
                                                ],
                                                colors: [
                                                  Colors.blue,
                                                  Colors.indigo,
                                                  Colors.yellow,
                                                  Colors.teal,
                                                ],
                                              )),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                      top: 20.0),
                                                  child: Text(
                                                    "Discount",
                                                    style: TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  state.discount.length
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 60,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 10),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 20),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                2,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.5,
                                            child: LineChartSample2()),
                                        Column(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  4,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.5,
                                              child: LineChartSample1(),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  4,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.5,
                                              child: PieChartSample2(),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Container(
                                      child: DataTable(
                                        columns: const <DataColumn>[
                                          DataColumn(
                                            label: Text(
                                              'Name',
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ),
                                          DataColumn(
                                            label: Text(
                                              'Age',
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ),
                                          DataColumn(
                                            label: Text(
                                              'Role',
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ),
                                        ],
                                        rows: const <DataRow>[
                                          DataRow(
                                            cells: <DataCell>[
                                              DataCell(Text('Sarah')),
                                              DataCell(Text('19')),
                                              DataCell(Text('Student')),
                                            ],
                                          ),
                                          DataRow(
                                            cells: <DataCell>[
                                              DataCell(Text('Janine')),
                                              DataCell(Text('43')),
                                              DataCell(Text('Professor')),
                                            ],
                                          ),
                                          DataRow(
                                            cells: <DataCell>[
                                              DataCell(Text('William')),
                                              DataCell(Text('27')),
                                              DataCell(
                                                  Text('Associate Professor')),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ));
                        }
                        return Container();
                      },
                    )
                  : select == "user"
                      ? BlocBuilder<AdminBloc, AdminState>(
                          builder: (context, state) {
                            if (state is FailureState) {
                              return Expanded(flex: 5, child: Text("Error"));
                            }
                            if (state is LoadingState) {
                              return Expanded(
                                flex: 5,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }
                            if (state is SuccessState) {
                              return UserScreen(account: state.useraccount);
                            }
                            return Expanded(flex: 5, child: Container());
                          },
                        )
                      : select == "employee"
                          ? BlocBuilder<AdminBloc, AdminState>(
                              builder: (context, state) {
                                if (state is FailureState) {
                                  return Expanded(
                                    flex: 5,
                                    child: Text("Error"),
                                  );
                                }
                                if (state is LoadingState) {
                                  return Expanded(
                                    flex: 5,
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  );
                                }
                                if (state is SuccessState) {
                                  return EmployeeScreen(
                                      account: state.useraccount);
                                }
                                return Container();
                              },
                            )
                          : select == "ticket"
                              ? BlocBuilder<AdminBloc, AdminState>(
                                  builder: (context, state) {
                                    if (state is FailureState) {
                                      return Text("Error");
                                    }
                                    if (state is LoadingState) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    if (state is SuccessState) {
                                      return TicketPopular(
                                          ticket: state.ticket);
                                    }
                                    return Container();
                                  },
                                )
                              : select == "schedule"
                                  ? BlocBuilder<AdminBloc, AdminState>(
                                      builder: (context, state) {
                                        if (state is FailureState) {
                                          return Text("Error");
                                        }
                                        if (state is LoadingState) {
                                          return Expanded(
                                            flex: 5,
                                            child: Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          );
                                        }
                                        if (state is SuccessState) {
                                          return ScheduleScreen(
                                              schedule: state.schedule);
                                        }
                                        return Expanded(
                                            flex: 5, child: Container());
                                      },
                                    )
                                  : select == "discount"
                                      ? BlocBuilder<AdminBloc, AdminState>(
                                          builder: (context, state) {
                                            if (state is FailureState) {
                                              return Expanded(
                                                flex: 5,
                                                child: Text("Error"),
                                              );
                                            }
                                            if (state is LoadingState) {
                                              return Expanded(
                                                flex: 5,
                                                child: Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              );
                                            }
                                            if (state is SuccessState) {
                                              return DiscountScreen(
                                                  discount: state.discount);
                                            }
                                            return Expanded(
                                                flex: 5, child: Container());
                                          },
                                        )
                                      : select == "car"
                                          ? BlocBuilder<AdminBloc, AdminState>(
                                              builder: (context, state) {
                                                if (state is FailureState) {
                                                  return Expanded(
                                                    flex: 5,
                                                    child: Text("Error"),
                                                  );
                                                }
                                                if (state is LoadingState) {
                                                  return Expanded(
                                                    flex: 5,
                                                    child: Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    ),
                                                  );
                                                }
                                                if (state is SuccessState) {
                                                  return CarScreen(
                                                      car: state.car);
                                                }
                                                return Container();
                                              },
                                            )
                                          : select == "order/ticket"
                                              ? BlocBuilder<AdminBloc,
                                                  AdminState>(
                                                  builder: (context, state) {
                                                    if (state is FailureState) {
                                                      return Expanded(
                                                        flex: 5,
                                                        child: Text("Error"),
                                                      );
                                                    }
                                                    if (state is LoadingState) {
                                                      return Expanded(
                                                        flex: 5,
                                                        child: Center(
                                                          child:
                                                              CircularProgressIndicator(),
                                                        ),
                                                      );
                                                    }
                                                    if (state is SuccessState) {
                                                      return OrderTicket(
                                                          ticket: state
                                                              .ticketorder);
                                                    }
                                                    return Container();
                                                  },
                                                )
                                              : select == "order/rental"
                                                  ? BlocBuilder<AdminBloc,
                                                      AdminState>(
                                                      builder:
                                                          (context, state) {
                                                        if (state
                                                            is FailureState) {
                                                          return Expanded(
                                                            flex: 5,
                                                            child:
                                                                Text("Error"),
                                                          );
                                                        }
                                                        if (state
                                                            is LoadingState) {
                                                          return Expanded(
                                                            flex: 5,
                                                            child: Center(
                                                              child:
                                                                  CircularProgressIndicator(),
                                                            ),
                                                          );
                                                        }
                                                        if (state
                                                            is SuccessState) {
                                                          return OrderRental(
                                                              rentalorder:
                                                                  state.rental);
                                                        }
                                                        return Container();
                                                      },
                                                    )
                                                  : select == "time"
                                                      ? BlocBuilder<AdminBloc,
                                                          AdminState>(
                                                          builder:
                                                              (context, state) {
                                                            if (state
                                                                is FailureState) {
                                                              return Expanded(
                                                                flex: 5,
                                                                child: Text(
                                                                    "Error"),
                                                              );
                                                            }
                                                            if (state
                                                                is LoadingState) {
                                                              return Expanded(
                                                                flex: 5,
                                                                child: Center(
                                                                  child:
                                                                      CircularProgressIndicator(),
                                                                ),
                                                              );
                                                            }
                                                            if (state
                                                                is SuccessState) {
                                                              return TimeScreen(
                                                                  pickup: state
                                                                      .pickup);
                                                            }
                                                            return Expanded(
                                                                flex: 5,
                                                                child:
                                                                    Container());
                                                          },
                                                        )
                                                      : select == "position"
                                                          ? BlocBuilder<
                                                              AdminBloc,
                                                              AdminState>(
                                                              builder: (context,
                                                                  state) {
                                                                if (state
                                                                    is FailureState) {
                                                                  return Expanded(
                                                                    flex: 5,
                                                                    child: Text(
                                                                        "Error"),
                                                                  );
                                                                }
                                                                if (state
                                                                    is LoadingState) {
                                                                  return Expanded(
                                                                    flex: 5,
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          CircularProgressIndicator(),
                                                                    ),
                                                                  );
                                                                }
                                                                if (state
                                                                    is SuccessState) {
                                                                  return PositionScreen(
                                                                      seat: state
                                                                          .seat);
                                                                }
                                                                return Expanded(
                                                                    flex: 5,
                                                                    child:
                                                                        Container());
                                                              },
                                                            )
                                                          : Text("null"),
            ],
          ),
        ),
      ),
    );
  }
}
