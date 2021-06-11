import 'package:admin_managerpassenger/blocs/admin/bloc/admin_bloc.dart';
import 'package:admin_managerpassenger/blocs/ticket/model/schedule.dart';
import 'package:admin_managerpassenger/blocs/ticket/model/ticket.dart';
import 'package:admin_managerpassenger/utils/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormEditSchedule extends StatefulWidget {
  Schedule schedule;
  List<Ticket> ticket;

  FormEditSchedule(this.schedule, this.ticket);

  @override
  _FormEditScheduleState createState() => _FormEditScheduleState();
}

class _FormEditScheduleState extends State<FormEditSchedule> {
  TextEditingController idController = TextEditingController();
  TextEditingController idtourController = TextEditingController();
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();
  TextEditingController createdController = TextEditingController();
  TextEditingController updatedController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Ticket selectTicket;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    idController.text = widget.schedule.id;
    idtourController.text = widget.schedule.idtour;
    startController.text = widget.schedule.locationstart;
    endController.text = widget.schedule.locationend;
    createdController.text = widget.schedule.createdAt.toString();
    updatedController.text = widget.schedule.updatedAt.toString();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      title: Center(
        child: Text(
          "Update Schedule",
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
            List<TextEditingController> locationcontroller = List.generate(
                widget.schedule.schedule.length,
                (i) => TextEditingController());
            List<TextEditingController> timecontroller = List.generate(
                widget.schedule.schedule.length,
                (i) => TextEditingController());
            List<TextEditingController> addresscontroller = List.generate(
                widget.schedule.schedule.length,
                (i) => TextEditingController());
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
                                "ID Tour",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height / 20,
                                width: MediaQuery.of(context).size.width / 2.5,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 0.0),
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(12.0)),
                                margin: EdgeInsets.symmetric(vertical: 10),
                                alignment: Alignment.center,
                                child: DropdownButtonFormField<Ticket>(
                                  hint: Text("Select item"),
                                  value: selectTicket,
                                  onChanged: (Ticket value) {
                                    setState(() {
                                      selectTicket = value;
                                      startController.text =
                                          selectTicket.locationstart;
                                      endController.text =
                                          selectTicket.locationend;
                                    });
                                  },
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                  items: widget.ticket.map((Ticket tinh) {
                                    return DropdownMenuItem<Ticket>(
                                      value: tinh,
                                      child: Text(
                                        "${tinh.id} (${tinh.locationstart} - ${tinh.locationend}) ",
                                        style: AppTextStyles.textSize14(),
                                      ),
                                    );
                                  }).toList(),
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
                                      readOnly: true,
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
                              Spacer(),
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
                                      readOnly: true,
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
                            ],
                          ),
                          Row(
                            children: [
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
                              Spacer(),
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
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Schedule",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 1.3,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 400.0),
                      child: ListView.builder(
                        itemCount: widget.schedule.schedule.length,
                        itemBuilder: (context, index) {
                          locationcontroller[index].text =
                              widget.schedule.schedule[index].location;
                          timecontroller[index].text =
                              widget.schedule.schedule[index].time;
                          addresscontroller[index].text =
                              widget.schedule.schedule[index].address;
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Location ${index + 1}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                20,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5.5,
                                        margin:
                                            EdgeInsets.symmetric(vertical: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.3),
                                            borderRadius:
                                                BorderRadius.circular(12.0)),
                                        child: TextField(
                                          controller: locationcontroller[index],
                                          onChanged: (value) {
                                            widget.schedule.schedule[index]
                                                .location = value;
                                          },
                                          decoration: InputDecoration(
                                              hintMaxLines: 10,
                                              border: InputBorder.none,
                                              hintText: "Schedule",
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                horizontal: 24.0,
                                                vertical: 20.0,
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Time ${index + 1}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                20,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5.5,
                                        margin:
                                            EdgeInsets.symmetric(vertical: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.3),
                                            borderRadius:
                                                BorderRadius.circular(12.0)),
                                        child: TextField(
                                          controller: timecontroller[index],
                                          onChanged: (value) {
                                            widget.schedule.schedule[index]
                                                .time = value;
                                          },
                                          decoration: InputDecoration(
                                              hintMaxLines: 10,
                                              border: InputBorder.none,
                                              hintText: "Time",
                                              contentPadding:
                                                  EdgeInsets.symmetric(
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
                                    "Address ${index + 1}",
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
                                      onChanged: (value) {
                                        widget.schedule.schedule[index]
                                            .address = value;
                                      },
                                      controller: addresscontroller[index],
                                      decoration: InputDecoration(
                                          hintMaxLines: 10,
                                          border: InputBorder.none,
                                          hintText: "Address",
                                          contentPadding: EdgeInsets.symmetric(
                                            horizontal: 24.0,
                                            vertical: 20.0,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 830.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        state is AddLoadingState
                            ? Container(
                                height: MediaQuery.of(context).size.height / 18,
                                width: MediaQuery.of(context).size.width / 25,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  BlocProvider.of<AdminBloc>(context).add(
                                      UpdateScheduleEvent(
                                          id: widget.schedule.id,
                                          idtour: selectTicket.id,
                                          locationstart: startController.text,
                                          locationend: endController.text,
                                          schedule: widget.schedule.schedule));
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 18,
                                  width: MediaQuery.of(context).size.width / 25,
                                  decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.circular(12)),
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
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
