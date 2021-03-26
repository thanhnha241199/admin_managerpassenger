import 'package:admin_managerpassenger/blocs/admin/bloc/admin_bloc.dart';
import 'package:admin_managerpassenger/blocs/admin/model/user_account.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormEditAccount extends StatefulWidget {
  UserAccount userAccount;

  FormEditAccount(this.userAccount);

  @override
  _FormEditAccountState createState() => _FormEditAccountState();
}

class _FormEditAccountState extends State<FormEditAccount> {
  TextEditingController idController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController createdController = TextEditingController();
  TextEditingController updatedController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    idController.text = widget.userAccount.id ?? null;
    emailController.text = widget.userAccount.email ?? null;
    nameController.text = widget.userAccount.name ?? null;
    phoneController.text = widget.userAccount.phone ?? null;
    typeController.text = widget.userAccount.type ?? null;
    createdController.text = widget.userAccount.createdAt.toString() ?? null;
    updatedController.text = widget.userAccount.updatedAt.toString() ?? null;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      title: Center(
        child: Text(
          "Update Account",
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
              height: MediaQuery.of(context).size.height / 1.25,
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
                                "Email",
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
                                  controller: emailController,
                                  decoration: InputDecoration(
                                      hintMaxLines: 10,
                                      border: InputBorder.none,
                                      hintText: "Email",
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Phone",
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
                                  controller: phoneController,
                                  decoration: InputDecoration(
                                      hintMaxLines: 10,
                                      border: InputBorder.none,
                                      hintText: "Phone",
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
                                "Type",
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
                                  controller: typeController,
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
                            height: 30,
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
                                            UpdateUserEvent(
                                                id: idController.text,
                                                email: emailController.text,
                                                name: nameController.text,
                                                phone: phoneController.text,
                                                type: typeController.text));
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
