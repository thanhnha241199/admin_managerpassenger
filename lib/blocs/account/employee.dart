import 'package:admin_managerpassenger/blocs/admin/bloc/admin_bloc.dart';
import 'package:admin_managerpassenger/blocs/admin/model/user_account.dart';
import 'package:admin_managerpassenger/blocs/form/form_add_employee.dart';
import 'package:admin_managerpassenger/blocs/form/form_add_user.dart';
import 'package:admin_managerpassenger/blocs/form/form_edit_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class EmployeeScreen extends StatefulWidget {
  List<UserAccount> account;

  EmployeeScreen({this.account});

  @override
  _EmployeeScreenState createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  TextEditingController searchController = TextEditingController();
  bool _fromTop = true;
  List<UserAccount> user;
  bool checkName = false, checkPhone = false, checkEmail = false;

  final format = new DateFormat('yyyy-MM-dd hh:mm');
  @override
  Widget build(BuildContext context) {
    user = widget.account.where((element) => element.type == "0").toList();
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
                                "Add Employee",
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
                              return FormAddEmployee();
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
                            if (checkEmail) {
                              setState(() {
                                widget.account
                                    .sort((a, b) => a.email.compareTo(b.email));
                                checkEmail = !checkEmail;
                              });
                            } else {
                              setState(() {
                                widget.account
                                    .sort((b, a) => a.email.compareTo(b.email));
                                checkEmail = !checkEmail;
                              });
                            }
                          },
                          child: Row(
                            children: [
                              Text('Email'),
                              Icon(Icons.import_export)
                            ],
                          ),
                        ),
                      ),
                      DataColumn(
                        label: GestureDetector(
                          onTap: () {
                            if (checkName) {
                              setState(() {
                                widget.account
                                    .sort((a, b) => a.name.compareTo(b.name));
                                checkName = !checkName;
                              });
                            } else {
                              setState(() {
                                widget.account
                                    .sort((b, a) => a.name.compareTo(b.name));
                                checkName = !checkName;
                              });
                            }
                          },
                          child: Row(
                            children: [Text("Name"), Icon(Icons.import_export)],
                          ),
                        ),
                      ),
                      DataColumn(
                        label: GestureDetector(
                          onTap: () {
                            if (checkPhone) {
                              setState(() {
                                widget.account
                                    .sort((a, b) => a.phone.compareTo(b.phone));
                                checkPhone = !checkPhone;
                              });
                            } else {
                              setState(() {
                                widget.account
                                    .sort((b, a) => a.phone.compareTo(b.phone));
                                checkPhone = !checkPhone;
                              });
                            }
                          },
                          child: Row(
                            children: [
                              Text("Phone"),
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
                        user.length,
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
                                DataCell(Text(user[index].email)),
                                DataCell(
                                  Text(user[index].name),
                                ),
                                DataCell(Text(user[index].phone)),
                                DataCell(
                                    Text(format.format(user[index].createdAt))),
                                DataCell(
                                    Text(format.format(user[index].updatedAt))),
                                DataCell(IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return FormEditAccount(user[index]);
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
                                                    .add(DeleteUserEvent(
                                                        id: user[index].id));
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
