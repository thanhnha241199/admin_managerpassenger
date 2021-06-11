import 'package:admin_managerpassenger/blocs/admin/bloc/admin_bloc.dart';
import 'package:admin_managerpassenger/blocs/form/form_add_discount.dart';
import 'package:admin_managerpassenger/blocs/form/form_edit_discount.dart';
import 'package:admin_managerpassenger/blocs/ticket/model/discount.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DiscountScreen extends StatefulWidget {
  List<Discount> discount;

  DiscountScreen({this.discount});
  @override
  _DiscountScreenState createState() => _DiscountScreenState();
}

class _DiscountScreenState extends State<DiscountScreen> {
  TextEditingController searchController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 5,
        child: Container(
          color: Colors.grey.withOpacity(0.2),
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 19,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        "Discount",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: MediaQuery.of(context).size.height / 20,
                      width: MediaQuery.of(context).size.width / 8,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(12.0)),
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  print("search");
                                },
                                icon: Icon(Icons.search)),
                            hintMaxLines: 10,
                            border: InputBorder.none,
                            hintText: "Search",
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 24.0, vertical: 3.0)),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.blueAccent.withOpacity(0.7)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Add Discount",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.add,
                                size: 20,
                              ),
                            ],
                          )),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return FormAddDiscount();
                            });
                      },
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 60),
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.9 / 1,
                  ),
                  itemCount: widget.discount.length,
                  itemBuilder: (_, index) => Container(
                    child: Column(
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height / 6,
                            width: MediaQuery.of(context).size.width / 3.8,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment(0.8, 0.0),
                                colors: [Color(0xffee0000), Color(0xffeeee00)],
                                tileMode: TileMode.repeated,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 50.0, top: 20),
                                  child: Text(
                                    "Unlimited",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 25),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 50.0, bottom: 30),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${widget.discount[index].sale}%",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 30),
                                          ),
                                          Text(
                                            widget.discount[index].code,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.vignette_outlined,
                                        color: Colors.white.withOpacity(0.2),
                                        size: 85,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )),
                        Container(
                          height: MediaQuery.of(context).size.height / 20,
                          width: MediaQuery.of(context).size.width / 3.8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 50),
                                    child: Text(
                                      widget.discount[index].title,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Spacer(),
                                  PopupMenuButton<String>(
                                    icon: Icon(Icons.more_vert),
                                    itemBuilder: (BuildContext context) =>
                                        <PopupMenuEntry<String>>[
                                      PopupMenuItem<String>(
                                          value: 'Edit',
                                          child: ListTile(
                                              onTap: () {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return FormEditDiscount(
                                                          widget
                                                              .discount[index]);
                                                    });
                                              },
                                              leading: Icon(Icons.edit),
                                              title: Text('Edit'))),
                                      PopupMenuItem<String>(
                                          value: 'Delete',
                                          child: ListTile(
                                              onTap: () {
                                                showGeneralDialog(
                                                  barrierLabel: "Alert",
                                                  barrierDismissible: true,
                                                  barrierColor: Colors.black
                                                      .withOpacity(0.5),
                                                  transitionDuration: Duration(
                                                      milliseconds: 300),
                                                  context: context,
                                                  pageBuilder:
                                                      (context, anim1, anim2) {
                                                    return AlertDialog(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25)),
                                                      title: Text(
                                                          'AlertDialog Title'),
                                                      content:
                                                          SingleChildScrollView(
                                                        child: ListBody(
                                                          children: <Widget>[
                                                            Text(
                                                                'This is a demo alert dialog.'),
                                                            Text(
                                                                'Would you like to approve of this message?'),
                                                          ],
                                                        ),
                                                      ),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          child: Text('Yes'),
                                                          onPressed: () {
                                                            print(widget
                                                                .discount[index]
                                                                .id);
                                                            BlocProvider.of<
                                                                        AdminBloc>(
                                                                    context)
                                                                .add(DeleteDiscountEvent(
                                                                    id: widget
                                                                        .discount[
                                                                            index]
                                                                        .id));
                                                            Navigator.pop(
                                                                context);
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                        TextButton(
                                                          child: Text('No'),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                  transitionBuilder: (context,
                                                      anim1, anim2, child) {
                                                    return SlideTransition(
                                                      position: Tween(
                                                              begin: Offset(
                                                                  0,
                                                                  true
                                                                      ? -1
                                                                      : 1),
                                                              end: Offset(0, 0))
                                                          .animate(anim1),
                                                      child: child,
                                                    );
                                                  },
                                                );
                                              },
                                              leading: Icon(Icons.delete),
                                              title: Text('Delete')))
                                    ],
                                  )
                                ],
                              ),
                              // Row(
                              //   children: [
                              //     Padding(
                              //       padding: const EdgeInsets.only(left: 50),
                              //       child: Text(
                              //         "18/03/2020 11:00 p.m",
                              //         style: TextStyle(
                              //             fontSize: 13,
                              //             fontWeight: FontWeight.w500),
                              //       ),
                              //     ),
                              //     Spacer(),
                              //     Padding(
                              //       padding: const EdgeInsets.only(right: 10.0),
                              //       child: Text("15 uses"),
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
