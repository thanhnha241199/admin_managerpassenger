import 'package:admin_managerpassenger/blocs/admin/bloc/admin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormAddSeat extends StatefulWidget {
  @override
  _FormAddSeatState createState() => _FormAddSeatState();
}

class _FormAddSeatState extends State<FormAddSeat> {
  TextEditingController idtourController = TextEditingController();
  TextEditingController idcarController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<bool> checked = [true, true, false];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      title: Center(
          child: Text(
        "Add Seat",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      )),
      content: BlocListener<AdminBloc, AdminState>(
        listener: (context, state) {
          if (state is SuccessState) {
            Navigator.pop(context);
          }
        },
        child: BlocBuilder<AdminBloc, AdminState>(
          builder: (context, state) {
            return Container(
              height: MediaQuery.of(context).size.height / 1.8,
              width: MediaQuery.of(context).size.width / 2.5,
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Tour ID",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 20,
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.3),
                                      borderRadius:
                                          BorderRadius.circular(12.0)),
                                  child: TextField(
                                    controller: idtourController,
                                    decoration: InputDecoration(
                                        hintMaxLines: 10,
                                        border: InputBorder.none,
                                        hintText: "Tour ID",
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 24.0,
                                          vertical: 20.0,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Car ID",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 20,
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.3),
                                      borderRadius:
                                          BorderRadius.circular(12.0)),
                                  child: TextField(
                                    controller: idcarController,
                                    decoration: InputDecoration(
                                        hintMaxLines: 10,
                                        border: InputBorder.none,
                                        hintText: "Car ID",
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 24.0,
                                          vertical: 20.0,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (var i = 0; i < 3; i += 1)
                                Row(
                                  children: [
                                    Checkbox(
                                      onChanged: (bool value) {
                                        setState(() {
                                          checked[i] = value;
                                        });
                                      },
                                      // tristate: i == 1,
                                      value: checked[i],
                                      activeColor: Color(0xFF6200EE),
                                    ),
                                    Text(
                                      'Floors ${i + 1}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1
                                          .copyWith(
                                              color: i == 4
                                                  ? Colors.black38
                                                  : Colors.black),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              state is AddLoadingState
                                  ? Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              22,
                                      width: MediaQuery.of(context).size.width /
                                          28,
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        List<String> floors1 = [
                                          "trong",
                                          "checked",
                                          "trong",
                                          "trong",
                                          "trong",
                                          "trong",
                                          "trong",
                                          "trong",
                                          "trong",
                                          "trong",
                                          "trong",
                                          "trong",
                                          "trong",
                                          "trong",
                                          "trong",
                                          "trong",
                                          "trong",
                                          "trong",
                                          "trong",
                                          "trong",
                                          "trong"
                                        ];
                                        List<String> floors2 = [
                                          "trong",
                                          "checked",
                                          "trong",
                                          "trong",
                                          "trong",
                                          "trong",
                                          "trong",
                                          "trong",
                                          "trong",
                                          "trong",
                                          "trong",
                                          "trong",
                                          "trong",
                                          "trong",
                                          "trong",
                                          "trong",
                                          "trong",
                                          "trong",
                                          "trong",
                                          "trong",
                                          "trong"
                                        ];
                                        BlocProvider.of<AdminBloc>(context).add(
                                            AddSeatEvent(
                                                floors1: floors1,
                                                tourid: idtourController.text,
                                                carid: idcarController.text,
                                                floors2: floors2));
                                      },
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                22,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                28,
                                        decoration: BoxDecoration(
                                            color: Colors.blueAccent,
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Center(
                                          child: Text("Save"),
                                        ),
                                      ),
                                    ),
                              SizedBox(
                                width: 50,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 22,
                                  width: MediaQuery.of(context).size.width / 28,
                                  decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Center(
                                    child: Text("Close"),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
