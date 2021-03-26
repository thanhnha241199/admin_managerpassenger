import 'package:admin_managerpassenger/blocs/admin/bloc/admin_bloc.dart';
import 'package:admin_managerpassenger/blocs/car/model/car.dart';
import 'package:admin_managerpassenger/blocs/ticket/model/pickup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormAddPickup extends StatefulWidget {
  @override
  _FormAddPickupState createState() => _FormAddPickupState();
}

class _FormAddPickupState extends State<FormAddPickup> {
  TextEditingController touridController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<String> list_time = new List();
  int number_time = 0;
  int number_address = 0;
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
        list_time.add(_time.hour.toString() + ":" + _time.minute.toString());
        number_time++;
        print(list_time);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<TextEditingController> addresscontroller =
        List.generate(number_address, (i) => TextEditingController());
    List<TextEditingController> titlecontroller =
        List.generate(number_address, (i) => TextEditingController());
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      title: Center(
        child: Text(
          "ADD PickUp",
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
                              number_time == 0
                                  ? Text(" ")
                                  : GridView.builder(
                                      shrinkWrap: true,
                                      gridDelegate:
                                          SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 100,
                                        childAspectRatio: 4 / 2,
                                        crossAxisSpacing: 50,
                                      ),
                                      itemCount: number_time,
                                      itemBuilder: (context, index) {
                                        return Chip(
                                          deleteIcon: Icon(
                                            Icons.close,
                                          ),
                                          onDeleted: () {
                                            setState(() {
                                              list_time.removeAt(index);
                                            });
                                          },
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 15),
                                          label:
                                              Text(list_time[index].toString()),
                                        );
                                      },
                                    )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Address",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          number_address++;
                                        });
                                      },
                                      icon: Icon(Icons.add))
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 230, left: 10),
                      child: Container(
                        height: 500,
                        child: ListView.builder(
                          itemCount: number_address,
                          itemBuilder: (context, index) {
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
                                  List<Address> address = new List();
                                  for (int i = 0; i < number_address; i++) {
                                    address.add(new Address(
                                        address: addresscontroller[i].text,
                                        title: titlecontroller[i].text));
                                  }
                                  print(address);
                                  BlocProvider.of<AdminBloc>(context).add(
                                      AddPickUpEvent(
                                          address: address,
                                          time: list_time,
                                          tourid: touridController.text));
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
