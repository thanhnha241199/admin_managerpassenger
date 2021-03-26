import 'package:admin_managerpassenger/blocs/admin/bloc/admin_bloc.dart';
import 'package:admin_managerpassenger/blocs/ticket/model/ticket.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormEditTicket extends StatefulWidget {
  Ticket ticket;

  FormEditTicket(this.ticket);

  @override
  _FormEditTicketState createState() => _FormEditTicketState();
}

class _FormEditTicketState extends State<FormEditTicket> {
  TextEditingController idController = TextEditingController();
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController rangeController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController createdController = TextEditingController();
  TextEditingController updatedController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    idController.text = widget.ticket.id;
    startController.text = widget.ticket.locationstart;
    endController.text = widget.ticket.locationend;
    timeController.text = widget.ticket.time;
    rangeController.text = widget.ticket.range;
    priceController.text = widget.ticket.price;
    createdController.text = widget.ticket.createdAt.toString();
    updatedController.text = widget.ticket.updatedAt.toString();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      title: Center(
        child: Text(
          "Update Ticket",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      content: BlocListener<AdminBloc, AdminState>(
        listener: (context, state) {
          if (state is SuccessState) {
            Navigator.pop(context);
          }
        },
        child: BlocBuilder<AdminBloc, AdminState>(
          builder: (context, state) {
            return Container(
              height: MediaQuery.of(context).size.height / 1.1,
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "ID",
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
                                  enabled: false,
                                  controller: idController,
                                  decoration: InputDecoration(
                                      hintMaxLines: 10,
                                      border: InputBorder.none,
                                      hintText: "ID",
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 24.0,
                                        vertical: 20.0,
                                      )),
                                ),
                              ),
                            ],
                          ),
                          Column(
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
                                height: MediaQuery.of(context).size.height / 20,
                                width: MediaQuery.of(context).size.width / 2.5,
                                margin: EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(12.0)),
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
                          Column(
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
                                height: MediaQuery.of(context).size.height / 20,
                                width: MediaQuery.of(context).size.width / 2.5,
                                margin: EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(12.0)),
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
                          Column(
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
                          Row(
                            children: [
                              Column(
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
                                    width: MediaQuery.of(context).size.width / 5.5,
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
                              SizedBox(width: 40,),
                              Column(
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
                                    width: MediaQuery.of(context).size.width / 5.5,
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
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "CreatedAt",
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
                                  enabled: false,
                                  controller: createdController,
                                  decoration: InputDecoration(
                                      hintMaxLines: 10,
                                      border: InputBorder.none,
                                      hintText: "CreatedAt",
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 24.0,
                                        vertical: 20.0,
                                      )),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "UpdatedAt",
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
                                  enabled: false,
                                  controller: updatedController,
                                  decoration: InputDecoration(
                                      hintMaxLines: 10,
                                      border: InputBorder.none,
                                      hintText: "UpdatedAt",
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 24.0,
                                        vertical: 20.0,
                                      )),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 7,
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
                                        BlocProvider.of<AdminBloc>(context).add(
                                            UpdateTicketEvent(
                                                id: idController.text,
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
                                width: 20,
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
