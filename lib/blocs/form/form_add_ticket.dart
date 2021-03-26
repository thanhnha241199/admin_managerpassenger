import 'package:admin_managerpassenger/blocs/admin/bloc/admin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormAddTicket extends StatefulWidget {
  @override
  _FormAddTicketState createState() => _FormAddTicketState();
}

class _FormAddTicketState extends State<FormAddTicket> {
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController rangeController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      title: Center(
          child: Text(
        "Add Ticket",
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
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Location Start",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height / 20,
                                      width:
                                          MediaQuery.of(context).size.width / 5.5,
                                      margin: EdgeInsets.symmetric(vertical: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      child: TextField(
                                        controller: startController,
                                        decoration: InputDecoration(
                                            hintMaxLines: 10,
                                            border: InputBorder.none,
                                            hintText: "Location Start",
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
                                      "Location End",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height / 20,
                                      width:
                                          MediaQuery.of(context).size.width / 5.5,
                                      margin: EdgeInsets.symmetric(vertical: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      child: TextField(
                                        controller: endController,
                                        decoration: InputDecoration(
                                            hintMaxLines: 10,
                                            border: InputBorder.none,
                                            hintText: "Location End",
                                            contentPadding: EdgeInsets.symmetric(
                                              horizontal: 24.0,
                                              vertical: 20.0,
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Time",
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
                                      color: Colors.grey.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(12.0)),
                                  child: TextField(
                                    controller: timeController,
                                    decoration: InputDecoration(
                                        hintMaxLines: 10,
                                        border: InputBorder.none,
                                        hintText: "Time",
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
                                  "Range",
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
                                      color: Colors.grey.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(12.0)),
                                  child: TextField(
                                    controller: rangeController,
                                    decoration: InputDecoration(
                                        hintMaxLines: 10,
                                        border: InputBorder.none,
                                        hintText: "Range",
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
                                  "Price",
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
                                      color: Colors.grey.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(12.0)),
                                  child: TextField(
                                    controller: priceController,
                                    decoration: InputDecoration(
                                        hintMaxLines: 10,
                                        border: InputBorder.none,
                                        hintText: "Price",
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 24.0,
                                          vertical: 20.0,
                                        )),
                                  ),
                                ),
                              ],
                            ),
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
                                          MediaQuery.of(context).size.height / 22,
                                      width:
                                          MediaQuery.of(context).size.width / 28,
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        BlocProvider.of<AdminBloc>(context).add(
                                            AddTicketEvent(
                                                locationstart:
                                                    startController.text,
                                                locationend: endController.text,
                                                range: rangeController.text,
                                                price: priceController.text,
                                                time: timeController.text));
                                      },
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                22,
                                        width: MediaQuery.of(context).size.width /
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
                                  height: MediaQuery.of(context).size.height / 22,
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
