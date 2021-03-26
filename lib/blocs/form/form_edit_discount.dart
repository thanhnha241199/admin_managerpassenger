import 'package:admin_managerpassenger/blocs/admin/bloc/admin_bloc.dart';
import 'package:admin_managerpassenger/blocs/ticket/model/discount.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormEditDiscount extends StatefulWidget {
  Discount discount;

  FormEditDiscount(this.discount);
  @override
  _FormEditDiscountState createState() => _FormEditDiscountState();
}

class _FormEditDiscountState extends State<FormEditDiscount> {
  TextEditingController idController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController saleController = TextEditingController();
  TextEditingController codetourController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController timestartController = TextEditingController();
  TextEditingController timeendController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int index = 0;
  DateTime _date;
  DateTime _dateend;

  void _selectDate() async {
    final DateTime newDate = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2017, 1),
      lastDate: DateTime(2022, 7),
      helpText: 'Select a date',
    );
    if (newDate != null) {
      setState(() {
        _date = newDate;
      });
    }
  }

  void _selectDateEnd() async {
    final DateTime newDate = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2017, 1),
      lastDate: DateTime(2022, 7),
      helpText: 'Select a date',
    );
    if (newDate != null) {
      setState(() {
        _date = newDate;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    idController.text = widget.discount.id;
    titleController.text = widget.discount.title;
    saleController.text = widget.discount.sale.toString();
    codetourController.text = widget.discount.code;
    descriptionController.text = widget.discount.description;
    _date = widget.discount.timestart;
    _dateend = widget.discount.timeend;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        title: Center(
            child: Text(
          "Update Discount",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        )),
        content: BlocListener<AdminBloc, AdminState>(
          listener: (context, state) {
            if (state is SuccessState) {
              Navigator.pop(context);
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Form(
                        key: _formKey,
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.5,
                                        margin:
                                            EdgeInsets.symmetric(vertical: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.3),
                                            borderRadius:
                                                BorderRadius.circular(12.0)),
                                        child: TextField(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Title",
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
                                                2.5,
                                        margin:
                                            EdgeInsets.symmetric(vertical: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.3),
                                            borderRadius:
                                                BorderRadius.circular(12.0)),
                                        child: TextField(
                                          controller: titleController,
                                          decoration: InputDecoration(
                                              hintMaxLines: 10,
                                              border: InputBorder.none,
                                              hintText: "Title",
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
                                            "Sale",
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
                                                color: Colors.grey
                                                    .withOpacity(0.3),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        12.0)),
                                            child: TextField(
                                              controller: saleController,
                                              decoration: InputDecoration(
                                                  hintMaxLines: 10,
                                                  border: InputBorder.none,
                                                  hintText: "Sale",
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
                                            "Code",
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
                                                color: Colors.grey
                                                    .withOpacity(0.3),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        12.0)),
                                            child: TextField(
                                              controller: codetourController,
                                              decoration: InputDecoration(
                                                  hintMaxLines: 10,
                                                  border: InputBorder.none,
                                                  hintText: "Code",
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Time start",
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
                                                  color: Colors.grey
                                                      .withOpacity(0.3),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0)),
                                              child: GestureDetector(
                                                  onTap: () {
                                                    _selectDate();
                                                  },
                                                  child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        horizontal: 24.0,
                                                        vertical: 15.0,
                                                      ),
                                                      child: Text('$_date')))),
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
                                            "Time ENd",
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
                                                  color: Colors.grey
                                                      .withOpacity(0.3),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0)),
                                              child: GestureDetector(
                                                  onTap: () {
                                                    _selectDateEnd();
                                                  },
                                                  child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        horizontal: 24.0,
                                                        vertical: 15.0,
                                                      ),
                                                      child:
                                                          Text('$_dateend')))),
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
                                        "Description",
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
                                                2.5,
                                        margin:
                                            EdgeInsets.symmetric(vertical: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.3),
                                            borderRadius:
                                                BorderRadius.circular(12.0)),
                                        child: TextField(
                                          controller: descriptionController,
                                          decoration: InputDecoration(
                                              hintMaxLines: 10,
                                              border: InputBorder.none,
                                              hintText: "Description",
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
                              padding: const EdgeInsets.only(top: 560),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  state is AddLoadingState
                                      ? Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              22,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              28,
                                          child: Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        )
                                      : GestureDetector(
                                          onTap: () {
                                            BlocProvider.of<AdminBloc>(context)
                                                .add(UpdateDiscountEvent(
                                                    id: idController.text,
                                                    title: titleController.text,
                                                    sale: int.parse(
                                                        saleController.text),
                                                    code:
                                                        codetourController.text,
                                                    timestart: _date,
                                                    timeend: _dateend,
                                                    description:
                                                        descriptionController
                                                            .text));
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
                                          MediaQuery.of(context).size.height /
                                              22,
                                      width: MediaQuery.of(context).size.width /
                                          28,
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
        ));
  }
}
