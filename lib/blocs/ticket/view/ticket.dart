import 'package:admin_managerpassenger/blocs/admin/bloc/admin_bloc.dart';
import 'package:admin_managerpassenger/blocs/admin/model/user_account.dart';
import 'package:admin_managerpassenger/blocs/car/model/car.dart';
import 'package:admin_managerpassenger/blocs/form/form_add_ticket.dart';
import 'package:admin_managerpassenger/blocs/form/form_edit_ticket.dart';
import 'package:admin_managerpassenger/blocs/ticket/model/ticket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TicketPopular extends StatefulWidget {
  List<Ticket> ticket;
  List<UserAccount> listUser;
  List<Car> listCar;
  TicketPopular({this.ticket, this.listUser, this.listCar});

  @override
  _TicketPopularState createState() => _TicketPopularState();
}

class _TicketPopularState extends State<TicketPopular> {
  TextEditingController searchController = TextEditingController();
  bool _fromTop = true;
  final format = new DateFormat('yyyy-MM-dd hh:mm');
  final format_number = new NumberFormat("#,###", "en_US");
  bool sort = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 5,
        child: Container(
          color: Colors.grey.withOpacity(0.2),
          child: ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 18,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        "Admin",
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
                                "Add Ticket",
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
                              return FormAddTicket();
                            });
                      },
                    )
                  ],
                ),
              ),
              Container(
                child: DataTable(
                    columns: <DataColumn>[
                      DataColumn(
                        label: Text('Index'),
                      ),
                      DataColumn(
                        label: GestureDetector(
                          onTap: () {
                            if (sort) {
                              setState(() {
                                widget.ticket
                                    .sort((a, b) => a.id.compareTo(b.id));
                                sort = !sort;
                              });
                            } else {
                              setState(() {
                                widget.ticket
                                    .sort((b, a) => a.id.compareTo(b.id));
                                sort = !sort;
                              });
                            }
                          },
                          child: Row(
                            children: [Text('ID'), Icon(Icons.import_export)],
                          ),
                        ),
                      ),
                      DataColumn(
                        label: GestureDetector(
                          onTap: () {
                            if (sort) {
                              setState(() {
                                widget.ticket.sort((a, b) =>
                                    a.locationstart.compareTo(b.locationstart));
                                sort = !sort;
                              });
                            } else {
                              setState(() {
                                widget.ticket.sort((b, a) =>
                                    a.locationstart.compareTo(b.locationstart));
                                sort = !sort;
                              });
                            }
                          },
                          child: Row(
                            children: [
                              Text('Location Start'),
                              Icon(Icons.import_export)
                            ],
                          ),
                        ),
                      ),
                      DataColumn(
                        label: GestureDetector(
                          onTap: () {
                            if (sort) {
                              setState(() {
                                widget.ticket.sort((a, b) =>
                                    a.locationend.compareTo(b.locationend));
                                sort = !sort;
                              });
                            } else {
                              setState(() {
                                widget.ticket.sort((b, a) =>
                                    a.locationend.compareTo(b.locationend));
                                sort = !sort;
                              });
                            }
                          },
                          child: Row(
                            children: [
                              Text('Location End'),
                              Icon(Icons.import_export)
                            ],
                          ),
                        ),
                      ),
                      DataColumn(
                        label: GestureDetector(
                          onTap: () {
                            if (sort) {
                              setState(() {
                                widget.ticket
                                    .sort((a, b) => a.time.compareTo(b.time));
                                sort = !sort;
                              });
                            } else {
                              setState(() {
                                widget.ticket
                                    .sort((b, a) => a.time.compareTo(b.time));
                                sort = !sort;
                              });
                            }
                          },
                          child: Row(
                            children: [Text('Time'), Icon(Icons.import_export)],
                          ),
                        ),
                      ),
                      DataColumn(
                        label: GestureDetector(
                          onTap: () {
                            if (sort) {
                              setState(() {
                                widget.ticket
                                    .sort((a, b) => a.range.compareTo(b.range));
                                sort = !sort;
                              });
                            } else {
                              setState(() {
                                widget.ticket
                                    .sort((b, a) => a.range.compareTo(b.range));
                                sort = !sort;
                              });
                            }
                          },
                          child: Row(
                            children: [
                              Text('Range'),
                              Icon(Icons.import_export)
                            ],
                          ),
                        ),
                      ),
                      DataColumn(
                        label: GestureDetector(
                          onTap: () {
                            if (sort) {
                              setState(() {
                                widget.ticket
                                    .sort((a, b) => a.price.compareTo(b.price));
                                sort = !sort;
                              });
                            } else {
                              setState(() {
                                widget.ticket
                                    .sort((b, a) => a.price.compareTo(b.price));
                                sort = !sort;
                              });
                            }
                          },
                          child: Row(
                            children: [
                              Text('Price'),
                              Icon(Icons.import_export)
                            ],
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text('CreatedAt'),
                      ),
                      DataColumn(
                        label: Text('UpdatedAt'),
                      ),
                      DataColumn(
                        label: Text('Edit'),
                      ),
                      DataColumn(
                        label: Text('Delete'),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                        widget.ticket.length,
                        (int index) => DataRow(
                              color: MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                if (states.contains(MaterialState.selected))
                                  return Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.08);
                                if (index % 2 == 0)
                                  return Colors.grey.withOpacity(0.3);
                                return null;
                              }),
                              cells: <DataCell>[
                                DataCell(Text((index + 1).toString())),
                                DataCell(Text(widget.ticket[index].id)),
                                DataCell(Text(
                                  widget.ticket[index].locationstart,
                                  overflow: TextOverflow.ellipsis,
                                )),
                                DataCell(Text(
                                  widget.ticket[index].locationend,
                                  overflow: TextOverflow.ellipsis,
                                )),
                                DataCell(Text(widget.ticket[index].time)),
                                DataCell(Text(widget.ticket[index].range)),
                                DataCell(Text(format_number.format(
                                    int.parse(widget.ticket[index].price)))),
                                DataCell(Text(format
                                    .format(widget.ticket[index].createdAt))),
                                DataCell(Text(format
                                    .format(widget.ticket[index].updatedAt))),
                                DataCell(IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return FormEditTicket(
                                              widget.ticket[index],
                                              widget.listUser,
                                              widget.listCar);
                                        });
                                  },
                                  icon: Icon(Icons.edit),
                                )),
                                DataCell(IconButton(
                                  onPressed: () {
                                    showGeneralDialog(
                                      barrierLabel: "Alert",
                                      barrierDismissible: true,
                                      barrierColor:
                                          Colors.black.withOpacity(0.5),
                                      transitionDuration:
                                          Duration(milliseconds: 300),
                                      context: context,
                                      pageBuilder: (context, anim1, anim2) {
                                        return AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          title: Text('AlertDialog Title'),
                                          content: SingleChildScrollView(
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
                                                BlocProvider.of<AdminBloc>(
                                                        context)
                                                    .add(DeleteTicketEvent(
                                                        id: widget
                                                            .ticket[index].id));
                                                Navigator.pop(context);
                                              },
                                            ),
                                            TextButton(
                                              child: Text('No'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                      transitionBuilder:
                                          (context, anim1, anim2, child) {
                                        return SlideTransition(
                                          position: Tween(
                                                  begin: Offset(
                                                      0, _fromTop ? -1 : 1),
                                                  end: Offset(0, 0))
                                              .animate(anim1),
                                          child: child,
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(Icons.delete),
                                )),
                              ],
                            ))),
              ),
            ],
          ),
        ));
  }
}
