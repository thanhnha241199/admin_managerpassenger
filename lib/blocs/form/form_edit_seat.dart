import 'package:admin_managerpassenger/blocs/admin/bloc/admin_bloc.dart';
import 'package:admin_managerpassenger/blocs/car/model/car.dart';
import 'package:admin_managerpassenger/blocs/ticket/model/seat.dart';
import 'package:admin_managerpassenger/blocs/ticket/model/ticket.dart';
import 'package:admin_managerpassenger/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormEditSeat extends StatefulWidget {
  Seat seat;
  List<Car> listCar;
  List<Ticket> ticket;
  FormEditSeat(this.seat, this.listCar, this.ticket);
  @override
  _FormEditSeatState createState() => _FormEditSeatState();
}

class _FormEditSeatState extends State<FormEditSeat> {
  TextEditingController idController = TextEditingController();
  TextEditingController idtourController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController idcarController = TextEditingController();
  TextEditingController locationStartController = TextEditingController();
  TextEditingController locationEndController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Car car;
  Ticket selectTicket;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    idtourController.text = widget.seat.idtour;
    idController.text = widget.seat.id;
    idcarController.text = widget.seat.idcar;
    widget.ticket.forEach((e) {
      if (widget.seat.idtour == e.id) {
        setState(() {
          locationStartController.text = e.locationstart;
          locationEndController.text = e.locationend;
        });
      }
    });
    widget.listCar.forEach((e) {
      if (e.id == widget.seat.idcar) {
        setState(() {
          car = e;
          nameController.text = car.name;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      title: Center(
          child: Text(
        "Edit Seat",
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
              height: MediaQuery.of(context).size.height / 1.4,
              width: MediaQuery.of(context).size.width / 2.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                                      "ID",
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
                                          5.5,
                                      margin:
                                          EdgeInsets.symmetric(vertical: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      child: TextField(
                                        readOnly: true,
                                        controller: idController,
                                        decoration: InputDecoration(
                                            hintMaxLines: 10,
                                            border: InputBorder.none,
                                            hintText: "ID",
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
                                          MediaQuery.of(context).size.height /
                                              20,
                                      width: MediaQuery.of(context).size.width /
                                          5.5,
                                      margin:
                                          EdgeInsets.symmetric(vertical: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      child: TextField(
                                        readOnly: true,
                                        controller: idtourController,
                                        decoration: InputDecoration(
                                            hintMaxLines: 10,
                                            border: InputBorder.none,
                                            hintText: "Tour ID",
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
                                          MediaQuery.of(context).size.height /
                                              20,
                                      width: MediaQuery.of(context).size.width /
                                          5.5,
                                      margin:
                                          EdgeInsets.symmetric(vertical: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      child: TextField(
                                        readOnly: true,
                                        controller: locationStartController,
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
                                          MediaQuery.of(context).size.height /
                                              20,
                                      width: MediaQuery.of(context).size.width /
                                          5.5,
                                      margin:
                                          EdgeInsets.symmetric(vertical: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      child: TextField(
                                        readOnly: true,
                                        controller: locationEndController,
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name",
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
                                  controller: nameController,
                                  decoration: InputDecoration(
                                      hintMaxLines: 10,
                                      border: InputBorder.none,
                                      hintText: "Name",
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 24.0,
                                        vertical: 20.0,
                                      )),
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
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 0.0),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.3),
                                      borderRadius:
                                          BorderRadius.circular(12.0)),
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  alignment: Alignment.center,
                                  child: DropdownButtonFormField<Car>(
                                    hint: Text("Select item"),
                                    value: car,
                                    onChanged: (Car value) {
                                      setState(() {
                                        car = value;
                                        idtourController.text = car.tourid;
                                        nameController.text = car.name;
                                        widget.ticket.forEach((e) {
                                          if (car.tourid == e.id) {
                                            setState(() {
                                              locationStartController.text =
                                                  e.locationstart;
                                              locationEndController.text =
                                                  e.locationend;
                                            });
                                          }
                                        });
                                      });
                                    },
                                    icon: Icon(Icons.keyboard_arrow_down),
                                    decoration: InputDecoration(
                                        border: InputBorder.none),
                                    items: widget.listCar.map((Car tinh) {
                                      return DropdownMenuItem<Car>(
                                        value: tinh,
                                        child: Text(
                                          "${tinh.id}",
                                          style: AppTextStyles.textSize14(),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Floors 1",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.seat.floors1.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding: EdgeInsets.symmetric(
                            horizontal: 2,
                          ),
                          child: ChoiceChip(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            label: Text("A${index + 1}"),
                            selected: widget.seat.floors1[index].toString() ==
                                    "checked"
                                ? true
                                : false,
                            onSelected: (value) {
                              setState(() {
                                widget.seat.floors1[index] == "checked"
                                    ? widget.seat.floors1[index] = "trong"
                                    : widget.seat.floors1[index] = "checked";
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Floors 2",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.seat.floors1.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding: EdgeInsets.symmetric(
                            horizontal: 2,
                          ),
                          child: ChoiceChip(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            label: Text("B${index + 1}"),
                            selected: widget.seat.floors2[index].toString() ==
                                    "checked"
                                ? true
                                : false,
                            onSelected: (value) {
                              setState(() {
                                widget.seat.floors2[index] == "checked"
                                    ? widget.seat.floors2[index] = "trong"
                                    : widget.seat.floors2[index] = "checked";
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          state is AddLoadingState
                              ? Container(
                                  height:
                                      MediaQuery.of(context).size.height / 22,
                                  width: MediaQuery.of(context).size.width / 28,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<AdminBloc>(context).add(
                                        UpdateSeatEvent(
                                            floors1: widget.seat.floors1,
                                            tourid: widget.seat.idtour,
                                            id: widget.seat.id,
                                            carid: car.id,
                                            floors2: widget.seat.floors2));
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
                                      child: Text("Save"),
                                    ),
                                  ),
                                ),
                          SizedBox(
                            width: 30,
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
                      ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
