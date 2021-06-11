import 'package:admin_managerpassenger/blocs/admin/bloc/admin_bloc.dart';
import 'package:admin_managerpassenger/blocs/admin/model/user_account.dart';
import 'package:admin_managerpassenger/blocs/ticket/model/ticket.dart';
import 'package:admin_managerpassenger/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormAddCar extends StatefulWidget {
  List<UserAccount> listaccount;
  List<Ticket> ticket;
  FormAddCar({this.listaccount, this.ticket});
  @override
  _FormAddCarState createState() => _FormAddCarState();
}

class _FormAddCarState extends State<FormAddCar> {
  TextEditingController touridController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController numberplateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  UserAccount driverUser, supportUser;
  Ticket selectTicket;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      title: Center(
          child: Text(
        "Add Car",
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
              height: MediaQuery.of(context).size.height / 1.2,
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
                                  "Name",
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
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "DriverID",
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
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 0.0),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      margin:
                                          EdgeInsets.symmetric(vertical: 10),
                                      alignment: Alignment.center,
                                      child:
                                          DropdownButtonFormField<UserAccount>(
                                        hint: Text("Select item"),
                                        value: driverUser,
                                        onChanged: (UserAccount value) {
                                          setState(() {
                                            driverUser = value;
                                          });
                                        },
                                        icon: Icon(Icons.keyboard_arrow_down),
                                        decoration: InputDecoration(
                                            border: InputBorder.none),
                                        items: widget.listaccount
                                            .map((UserAccount tinh) {
                                          return DropdownMenuItem<UserAccount>(
                                            value: tinh,
                                            child: Text(
                                              tinh.name,
                                              style: AppTextStyles.textSize14(),
                                            ),
                                          );
                                        }).toList(),
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
                                      "SupportID",
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
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 0.0),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      margin:
                                          EdgeInsets.symmetric(vertical: 10),
                                      alignment: Alignment.center,
                                      child:
                                          DropdownButtonFormField<UserAccount>(
                                        hint: Text("Select item"),
                                        value: supportUser,
                                        onChanged: (UserAccount value) {
                                          setState(() {
                                            supportUser = value;
                                          });
                                        },
                                        icon: Icon(Icons.keyboard_arrow_down),
                                        decoration: InputDecoration(
                                            border: InputBorder.none),
                                        items: widget.listaccount
                                            .map((UserAccount tinh) {
                                          return DropdownMenuItem<UserAccount>(
                                            value: tinh,
                                            child: Text(
                                              tinh.name,
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
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "TourID",
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
                                  child: DropdownButtonFormField<Ticket>(
                                    hint: Text("Select item"),
                                    value: selectTicket,
                                    onChanged: (Ticket value) {
                                      setState(() {
                                        selectTicket = value;
                                        nameController.text =
                                            selectTicket.locationstart +
                                                " - " +
                                                selectTicket.locationend;
                                      });
                                    },
                                    icon: Icon(Icons.keyboard_arrow_down),
                                    decoration: InputDecoration(
                                        border: InputBorder.none),
                                    items: widget.ticket.map((Ticket tinh) {
                                      return DropdownMenuItem<Ticket>(
                                        value: tinh,
                                        child: Text(
                                          tinh.id,
                                          style: AppTextStyles.textSize14(),
                                        ),
                                      );
                                    }).toList(),
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
                                  "Number Plate",
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
                                    controller: numberplateController,
                                    decoration: InputDecoration(
                                        hintMaxLines: 10,
                                        border: InputBorder.none,
                                        hintText: "Number Plate",
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
                                      MediaQuery.of(context).size.width / 2.5,
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
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Description",
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
                                    controller: descriptionController,
                                    maxLines: 5,
                                    decoration: InputDecoration(
                                        hintMaxLines: 10,
                                        border: InputBorder.none,
                                        hintText: "Description",
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
                            height: 100,
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
                                            AddCarEvent(
                                                tourid: selectTicket.id,
                                                driverid: driverUser.id,
                                                description:
                                                    descriptionController.text,
                                                name: nameController.text,
                                                numberplate:
                                                    numberplateController.text,
                                                supportid: supportUser.id,
                                                status: statusController.text));
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
                                                tourid: selectTicket.id,
                                                carid: "",
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
