import 'package:admin_managerpassenger/blocs/admin/bloc/admin_bloc.dart';
import 'package:admin_managerpassenger/blocs/car/model/car.dart';
import 'package:admin_managerpassenger/blocs/ticket/model/pickup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormEditPickup extends StatefulWidget {
  PickUp pickUp;

  FormEditPickup(this.pickUp);

  @override
  _FormEditPickupState createState() => _FormEditPickupState();
}

class _FormEditPickupState extends State<FormEditPickup> {
  TextEditingController idController = TextEditingController();
  TextEditingController touridController = TextEditingController();
  TextEditingController createdController = TextEditingController();
  TextEditingController updatedController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  TimeOfDay _time =
      TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);

  void _selectTime() async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
        widget.pickUp.time.length++;
        widget.pickUp.time[widget.pickUp.time.length - 1] =
            _time.hour.toString() + ":" + _time.minute.toString();
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    idController.text = widget.pickUp.id;
    touridController.text = widget.pickUp.tourid;
    createdController.text = widget.pickUp.createdAt.toString();
    updatedController.text = widget.pickUp.updatedAt.toString();
  }

  @override
  Widget build(BuildContext context) {
    List<TextEditingController> addresscontroller = List.generate(
        widget.pickUp.address.length, (i) => TextEditingController());
    List<TextEditingController> titlecontroller = List.generate(
        widget.pickUp.address.length, (i) => TextEditingController());
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      title: Center(
        child: Text(
          "Update PickUp",
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
                                "TOur ID",
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Time",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        _selectTime();
                                      },
                                      icon: Icon(Icons.add))
                                ],
                              ),
                              GridView.builder(
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 100,
                                  childAspectRatio: 4 / 2,
                                  crossAxisSpacing: 50,
                                ),
                                itemCount: widget.pickUp.time.length,
                                itemBuilder: (context, index) {
                                  return Chip(
                                    deleteIcon: Icon(
                                      Icons.close,
                                    ),
                                    onDeleted: () {
                                      setState(() {
                                        widget.pickUp.time.removeAt(index);
                                      });
                                    },
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 15),
                                    label: Text(
                                        widget.pickUp.time[index].toString()),
                                  );
                                },
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Address",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 530, left: 10),
                      child: Container(
                        height: 200,
                        child: ListView.builder(
                          itemCount: widget.pickUp.address.length,
                          itemBuilder: (context, index) {
                            titlecontroller[index].text =
                                widget.pickUp.address[index].title;
                            addresscontroller[index].text =
                                widget.pickUp.address[index].address;
                            return Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Title ${index + 1}",
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
                                        controller: titlecontroller[index],
                                        decoration: InputDecoration(
                                            hintMaxLines: 10,
                                            border: InputBorder.none,
                                            hintText: "Title ${index + 1}",
                                            contentPadding:
                                                EdgeInsets.symmetric(
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
                                      "Address ${index + 1}",
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
                                        controller: addresscontroller[index],
                                        decoration: InputDecoration(
                                            hintMaxLines: 10,
                                            border: InputBorder.none,
                                            hintText: "Address ${index + 1}",
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
                            );
                          },
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 780.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        state is AddLoadingState
                            ? Container(
                                height: MediaQuery.of(context).size.height / 22,
                                width: MediaQuery.of(context).size.width / 28,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  BlocProvider.of<AdminBloc>(context).add(
                                      UpdatePickUpEvent(
                                          address: widget.pickUp.address,
                                          id: widget.pickUp.id,
                                          time: widget.pickUp.time,
                                          tourid: widget.pickUp.tourid));
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 22,
                                  width: MediaQuery.of(context).size.width / 28,
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
