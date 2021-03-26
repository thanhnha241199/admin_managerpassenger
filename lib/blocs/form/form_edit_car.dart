import 'package:admin_managerpassenger/blocs/admin/bloc/admin_bloc.dart';
import 'package:admin_managerpassenger/blocs/car/model/car.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormEditCar extends StatefulWidget {
  Car car;

  FormEditCar(this.car);

  @override
  _FormEditCarState createState() => _FormEditCarState();
}

class _FormEditCarState extends State<FormEditCar> {
  TextEditingController idController = TextEditingController();
  TextEditingController driveidController = TextEditingController();
  TextEditingController supportidController = TextEditingController();
  TextEditingController touridController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController createdController = TextEditingController();
  TextEditingController updatedController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    idController.text = widget.car.id;
    driveidController.text = widget.car.driverid;
    supportidController.text = widget.car.supportid;
    touridController.text = widget.car.tourid;
    statusController.text = widget.car.status;
    createdController.text = widget.car.createdAt.toString();
    updatedController.text = widget.car.updatedAt.toString();
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
                                "Driver ID",
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
                                  controller: driveidController,
                                  decoration: InputDecoration(
                                      hintMaxLines: 10,
                                      border: InputBorder.none,
                                      hintText: "Driver ID",
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
                                "Support ID",
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
                                  controller: supportidController,
                                  decoration: InputDecoration(
                                      hintMaxLines: 10,
                                      border: InputBorder.none,
                                      hintText: "Support ID",
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
                                        MediaQuery.of(context).size.width / 5.5,
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.3),
                                        borderRadius:
                                            BorderRadius.circular(12.0)),
                                    child: TextField(
                                      controller: touridController,
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
                              SizedBox(
                                width: 40,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Status",
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
                                      controller: statusController,
                                      decoration: InputDecoration(
                                          hintMaxLines: 10,
                                          border: InputBorder.none,
                                          hintText: "Status",
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
                                            UpdateCarEvent(
                                                id: idController.text,
                                                idtour: touridController.text,
                                                driverid:
                                                    driveidController.text,
                                                supportid:
                                                    supportidController.text,
                                                status: statusController.text));
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
