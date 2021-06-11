import 'package:admin_managerpassenger/blocs/admin/bloc/admin_bloc.dart';
import 'package:admin_managerpassenger/blocs/form/form_add_ticket.dart';
import 'package:admin_managerpassenger/blocs/form/form_edit_ticket.dart';
import 'package:admin_managerpassenger/blocs/order/model/ticket_model.dart';
import 'package:admin_managerpassenger/blocs/ticket/model/ticket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class OrderTicket extends StatefulWidget {
  List<TicketOrder> ticket;

  OrderTicket({this.ticket});

  @override
  _OrderTicketState createState() => _OrderTicketState();
}

class _OrderTicketState extends State<OrderTicket> {
  TextEditingController searchController = TextEditingController();
  bool _fromTop = true;
  final format = new DateFormat('yyyy-MM-dd hh:mm');
  final format_number = new NumberFormat("#,###", "en_US");
  bool checksort = false;
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
                        "Order",
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
                            if (checksort) {
                              setState(() {
                                widget.ticket
                                    .sort((a, b) => a.id.compareTo(b.id));
                                checksort = !checksort;
                              });
                            } else {
                              setState(() {
                                widget.ticket
                                    .sort((b, a) => a.id.compareTo(b.id));
                                checksort = !checksort;
                              });
                            }
                          },
                          child: Row(
                            children: [Text("ID"), Icon(Icons.import_export)],
                          ),
                        ),
                      ),
                      DataColumn(
                        label: GestureDetector(
                          onTap: () {
                            if (checksort) {
                              setState(() {
                                widget.ticket.sort((a, b) =>
                                    a.paymentType.compareTo(b.paymentType));
                                checksort = !checksort;
                              });
                            } else {
                              setState(() {
                                widget.ticket.sort((b, a) =>
                                    a.paymentType.compareTo(b.paymentType));
                                checksort = !checksort;
                              });
                            }
                          },
                          child: Row(
                            children: [
                              Text("Payment Method"),
                              Icon(Icons.import_export)
                            ],
                          ),
                        ),
                      ),
                      DataColumn(
                        label: GestureDetector(
                          onTap: () {
                            if (checksort) {
                              setState(() {
                                widget.ticket.sort(
                                    (a, b) => a.status.compareTo(b.status));
                                checksort = !checksort;
                              });
                            } else {
                              setState(() {
                                widget.ticket.sort(
                                    (b, a) => a.status.compareTo(b.status));
                                checksort = !checksort;
                              });
                            }
                          },
                          child: Row(
                            children: [
                              Text("Status"),
                              Icon(Icons.import_export)
                            ],
                          ),
                        ),
                      ),
                      DataColumn(
                        label: GestureDetector(
                          onTap: () {
                            if (checksort) {
                              setState(() {
                                widget.ticket
                                    .sort((a, b) => a.seat.compareTo(b.seat));
                                checksort = !checksort;
                              });
                            } else {
                              setState(() {
                                widget.ticket
                                    .sort((b, a) => a.seat.compareTo(b.seat));
                                checksort = !checksort;
                              });
                            }
                          },
                          child: Row(
                            children: [Text("Seat"), Icon(Icons.import_export)],
                          ),
                        ),
                      ),
                      DataColumn(
                        label: GestureDetector(
                          onTap: () {
                            if (checksort) {
                              setState(() {
                                widget.ticket.sort((a, b) =>
                                    a.totalprice.compareTo(b.totalprice));
                                checksort = !checksort;
                              });
                            } else {
                              setState(() {
                                widget.ticket.sort((b, a) =>
                                    a.totalprice.compareTo(b.totalprice));
                                checksort = !checksort;
                              });
                            }
                          },
                          child: Row(
                            children: [
                              Text("Price"),
                              Icon(Icons.import_export)
                            ],
                          ),
                        ),
                      ),
                      DataColumn(
                        label: GestureDetector(
                          onTap: () {
                            if (checksort) {
                              setState(() {
                                widget.ticket.sort(
                                    (a, b) => a.timetour.compareTo(b.timetour));
                                checksort = !checksort;
                              });
                            } else {
                              setState(() {
                                widget.ticket.sort(
                                    (b, a) => a.timetour.compareTo(b.timetour));
                                checksort = !checksort;
                              });
                            }
                          },
                          child: Row(
                            children: [Text("Time"), Icon(Icons.import_export)],
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text('CreatedAt'),
                      ),
                      DataColumn(
                        label: Text('UpdatedAt'),
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
                                DataCell(
                                    Text(widget.ticket[index].paymentType)),
                                DataCell(Text(widget.ticket[index].status)),
                                DataCell(Text(widget.ticket[index].seat)),
                                DataCell(Text(widget.ticket[index].totalprice)),
                                DataCell(Text(widget.ticket[index].timetour)),
                                DataCell(Text(format
                                    .format(widget.ticket[index].createdAt))),
                                DataCell(Text(format
                                    .format(widget.ticket[index].updatedAt))),
                              ],
                            ))),
              ),
            ],
          ),
        ));
  }
}
