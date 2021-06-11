import 'package:admin_managerpassenger/blocs/admin/bloc/admin_bloc.dart';
import 'package:admin_managerpassenger/blocs/admin/model/user_account.dart';
import 'package:admin_managerpassenger/blocs/admin/model/user_authenticate.dart';
import 'package:admin_managerpassenger/blocs/car/model/car.dart';
import 'package:admin_managerpassenger/blocs/ticket/model/ticket.dart';
import 'package:admin_managerpassenger/utils/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormEditTicket extends StatefulWidget {
  Ticket ticket;
  List<UserAccount> listUser;
  List<Car> listCar;
  FormEditTicket(this.ticket, this.listUser, this.listCar);

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
  UserAccount selectedDriverUser = new UserAccount(name: "No Name");
  UserAccount selectedSupportUser = new UserAccount(name: "No Name");
  Car selectedCar;
  bool shuttleCheck;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    shuttleCheck = widget.ticket.shuttle == "true" ? true : false;
    idController.text = widget.ticket.id;
    selectEnd = widget.ticket.locationend;
    selectStart = widget.ticket.locationstart;
    timeController.text = widget.ticket.time;
    rangeController.text = widget.ticket.range;
    priceController.text = widget.ticket.price;
    createdController.text = widget.ticket.createdAt.toString();
    updatedController.text = widget.ticket.updatedAt.toString();
  }

  List<String> tinh = [
    "An Giang",
    "Bà Rịa – Vũng Tàu",
    "Bắc Giang",
    "Kon Tum",
    "Lai Châu",
    "Bắc Giang",
    "Lâm Đồng",
    "Bắc Kạn",
    "Lạng Sơn",
    "Bạc Liêu",
    "Lào Cai",
    "Bắc Ninh",
    "Long An",
    "Bến Tre",
    "Nam Định",
    "Bình Định",
    "Nghệ An",
    "Bình Dương",
    "Ninh Bình",
    "Bình Phước",
    "Ninh Thuận",
    "Bình Thuận",
    "Phú Thọ",
    "Cà Mau",
    "Phú Yên",
    "Cần Thơ",
    "Quảng Bình",
    "Cao Bằng",
    "Quảng Nam",
    "Đà Nẵng",
    "Quảng Ngãi",
    "Đắk Lắk",
    "Quảng Ninh",
    "Đắk Nông",
    "Quảng Trị",
    "Điện Biên",
    "Sóc Trăng",
    "Đồng Nai",
    "Sơn La",
    "Đồng Tháp",
    "Tây Ninh",
    "Gia Lai",
    "Thái Bình",
    "Hà Giang",
    "Thái Nguyên",
    "Hà Nam",
    "Thanh Hóa",
    "Hà Nội",
    "Thừa Thiên Huế",
    "Hà Tĩnh",
    "Tiền Giang",
    "Hải Dương",
    "TP. Hồ Chí Minh",
    "Hải Phòng",
    "Trà Vinh",
    "Hậu Giang",
    "Tuyên Quang",
    "Hòa Bình",
    "Vĩnh Long",
    "Hưng Yên",
    "Vĩnh Phúc",
    "Khánh Hòa",
    "Yên Bái"
  ];
  String selectStart, selectEnd;
  @override
  Widget build(BuildContext context) {
    widget.listUser.forEach((e) {
      if (e.id == widget.ticket.driverid) {
        setState(() {
          selectedDriverUser = e;
          print(e);
        });
      }
      if (e.id == widget.ticket.supportid) {
        setState(() {
          selectedSupportUser = e;
          print(e);
        });
      }
    });
    widget.listCar.forEach((e) {
      if (e.id == widget.ticket.carid) {
        setState(() {
          selectedCar = e;
          print(e);
        });
      }
    });

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
                          ListTile(
                            title: Text(
                              'Shuttle',
                            ),
                            leading: Switch(
                              value: shuttleCheck,
                              activeColor: Color(0xFF6200EE),
                              onChanged: (bool value) {
                                setState(() {
                                  shuttleCheck = value;
                                });
                              },
                            ),
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
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 0.0),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.3),
                                        borderRadius:
                                            BorderRadius.circular(12.0)),
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    alignment: Alignment.center,
                                    child: DropdownButtonFormField<String>(
                                      hint: Text("Select item"),
                                      value: selectStart,
                                      onChanged: (String value) {
                                        setState(() {
                                          selectStart = value;
                                        });
                                      },
                                      icon: Icon(Icons.keyboard_arrow_down),
                                      decoration: InputDecoration(
                                          border: InputBorder.none),
                                      items: tinh.map((String tinh) {
                                        return DropdownMenuItem<String>(
                                          value: tinh,
                                          child: Text(
                                            tinh,
                                            style: AppTextStyles.textSize14(),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 40.0,
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
                                    height:
                                        MediaQuery.of(context).size.height / 20,
                                    width:
                                        MediaQuery.of(context).size.width / 5.5,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 0.0),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.3),
                                        borderRadius:
                                            BorderRadius.circular(12.0)),
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    alignment: Alignment.center,
                                    child: DropdownButtonFormField<String>(
                                      hint: Text("Select item"),
                                      value: selectEnd,
                                      onChanged: (String value) {
                                        setState(() {
                                          selectEnd = value;
                                        });
                                      },
                                      icon: Icon(Icons.keyboard_arrow_down),
                                      decoration: InputDecoration(
                                          border: InputBorder.none),
                                      items: tinh.map((String tinh) {
                                        return DropdownMenuItem<String>(
                                          value: tinh,
                                          child: Text(
                                            tinh,
                                            style: AppTextStyles.textSize14(),
                                          ),
                                        );
                                      }).toList(),
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
                                    "Time",
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
                              SizedBox(
                                width: 40.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "CarID",
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
                                      value: selectedCar,
                                      onChanged: (Car value) {
                                        setState(() {
                                          selectedCar = value;
                                          print(selectedCar.toJson());
                                          widget.listUser.forEach((e) {
                                            if (e.id == selectedCar.driverid) {
                                              selectedDriverUser = e;
                                              print(selectedDriverUser.name);
                                            }
                                            if (e.id == selectedCar.supportid) {
                                              selectedSupportUser = e;
                                              print(selectedSupportUser.name);
                                            }
                                          });
                                        });
                                      },
                                      icon: Icon(Icons.keyboard_arrow_down),
                                      decoration: InputDecoration(
                                          border: InputBorder.none),
                                      items: widget.listCar.map((Car car) {
                                        return DropdownMenuItem<Car>(
                                          value: car,
                                          child: Text(
                                            car.id,
                                            style: AppTextStyles.textSize14(),
                                          ),
                                        );
                                      }).toList(),
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
                                    "Range",
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
                              SizedBox(
                                width: 40,
                              ),
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
                                    height:
                                        MediaQuery.of(context).size.height / 20,
                                    width:
                                        MediaQuery.of(context).size.width / 5.5,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.3),
                                        borderRadius:
                                            BorderRadius.circular(12.0)),
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "DriverID",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 0.0),
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
                                      child: Text(
                                        selectedDriverUser.name,
                                        style: AppTextStyles.textSize14(),
                                      )),
                                ],
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                        MediaQuery.of(context).size.height / 20,
                                    width:
                                        MediaQuery.of(context).size.width / 5.5,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 0.0),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.3),
                                        borderRadius:
                                            BorderRadius.circular(12.0)),
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    alignment: Alignment.center,
                                    child: Text(
                                      selectedSupportUser.name,
                                      style: AppTextStyles.textSize14(),
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
                                        BlocProvider.of<AdminBloc>(context)
                                            .add(UpdateTicketEvent(
                                          id: widget.ticket.id,
                                          locationstart: selectStart,
                                          locationend: selectEnd,
                                          range: rangeController.text,
                                          price: priceController.text,
                                          time: timeController.text,
                                          driverid: selectedDriverUser.id,
                                          carid: selectedCar.id,
                                          supportid: selectedSupportUser.id,
                                          shuttle: shuttleCheck.toString(),
                                        ));
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
