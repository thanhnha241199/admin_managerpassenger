import 'package:admin_managerpassenger/blocs/admin/bloc/admin_bloc.dart';
import 'package:admin_managerpassenger/blocs/counter/bloc/counter_bloc.dart';
import 'package:admin_managerpassenger/blocs/counter/bloc/counter_event.dart';
import 'package:admin_managerpassenger/blocs/ticket/model/schedule.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormAddSchedule extends StatefulWidget {
  @override
  _FormAddScheduleState createState() => _FormAddScheduleState();
}

class _FormAddScheduleState extends State<FormAddSchedule> {
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();
  TextEditingController idtourController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int number = 1;

  @override
  Widget build(BuildContext context) {
    List<TextEditingController> locationcontroller =
        List.generate(number, (i) => TextEditingController());
    List<TextEditingController> timecontroller =
        List.generate(number, (i) => TextEditingController());
    List<TextEditingController> addresscontroller =
        List.generate(number, (i) => TextEditingController());
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      title: Center(
          child: Text(
        "Add Schedule",
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
              height: MediaQuery.of(context).size.height / 1.6,
              width: MediaQuery.of(context).size.width / 2.5,
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Form(
                      key: _formKey,
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
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
                                      height:
                                          MediaQuery.of(context).size.height /
                                              20,
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      margin:
                                          EdgeInsets.symmetric(vertical: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      child: TextField(
                                        controller: idtourController,
                                        decoration: InputDecoration(
                                            hintMaxLines: 10,
                                            border: InputBorder.none,
                                            hintText: "ID Tour",
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              horizontal: 24.0,
                                              vertical: 20.0,
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Location Start",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              20,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              5.5,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10),
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              borderRadius:
                                                  BorderRadius.circular(12.0)),
                                          child: TextField(
                                            controller: startController,
                                            decoration: InputDecoration(
                                                hintMaxLines: 10,
                                                border: InputBorder.none,
                                                hintText: "Location Start",
                                                contentPadding:
                                                    EdgeInsets.symmetric(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Location End",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              20,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              5.5,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10),
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              borderRadius:
                                                  BorderRadius.circular(12.0)),
                                          child: TextField(
                                            controller: endController,
                                            decoration: InputDecoration(
                                                hintMaxLines: 10,
                                                border: InputBorder.none,
                                                hintText: "Location End",
                                                contentPadding:
                                                    EdgeInsets.symmetric(
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
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Schedule",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          number++;
                                        });
                                      },
                                      padding: EdgeInsets.only(bottom: 15),
                                      icon: Icon(Icons.add),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 250.0),
                            child: Container(
                              height: 300,
                              child: ListView.builder(
                                itemCount: number,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.symmetric(vertical: 20),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Location ${index + 1}",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            20,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5.5,
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey
                                                            .withOpacity(0.3),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    12.0)),
                                                    child: TextField(
                                                      controller:
                                                          locationcontroller[
                                                              index],
                                                      decoration:
                                                          InputDecoration(
                                                              hintMaxLines: 10,
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              hintText:
                                                                  "Location",
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .symmetric(
                                                                horizontal:
                                                                    24.0,
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
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Time ${index + 1}",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            20,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5.5,
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey
                                                            .withOpacity(0.3),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    12.0)),
                                                    child: TextField(
                                                      controller:
                                                          timecontroller[index],
                                                      decoration:
                                                          InputDecoration(
                                                              hintMaxLines: 10,
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              hintText: "Time",
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .symmetric(
                                                                horizontal:
                                                                    24.0,
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Address ${index + 1}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    20,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.5,
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 10),
                                                decoration: BoxDecoration(
                                                    color: Colors.grey
                                                        .withOpacity(0.3),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0)),
                                                child: TextField(
                                                  controller:
                                                      addresscontroller[index],
                                                  decoration: InputDecoration(
                                                      hintMaxLines: 10,
                                                      border: InputBorder.none,
                                                      hintText: "Address",
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
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
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 560),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                state is AddLoadingState
                                    ? Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                22,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                28,
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          List<ScheduleElement> schedule =
                                              new List();
                                          for (int i = 0; i < number; i++) {
                                            schedule.add(new ScheduleElement(
                                                address:
                                                    addresscontroller[i].text,
                                                location:
                                                    locationcontroller[i].text,
                                                time: timecontroller[i].text));
                                          }
                                          BlocProvider.of<AdminBloc>(context)
                                              .add(AddScheduleEvent(
                                                  idtour: idtourController.text,
                                                  locationstart:
                                                      startController.text,
                                                  locationend:
                                                      endController.text,
                                                  schedule: schedule));
                                        },
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              22,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
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
                                    width:
                                        MediaQuery.of(context).size.width / 28,
                                    decoration: BoxDecoration(
                                        color: Colors.blueAccent,
                                        borderRadius:
                                            BorderRadius.circular(12)),
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
