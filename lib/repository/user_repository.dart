import 'dart:async';

import 'package:admin_managerpassenger/blocs/admin/model/user_account.dart';
import 'package:admin_managerpassenger/blocs/admin/model/user_authenticate.dart';
import 'package:admin_managerpassenger/blocs/car/model/car.dart';
import 'package:admin_managerpassenger/blocs/ticket/model/discount.dart';
import 'package:admin_managerpassenger/blocs/ticket/model/pickup.dart';
import 'package:admin_managerpassenger/blocs/ticket/model/schedule.dart';
import 'package:admin_managerpassenger/blocs/ticket/model/seat.dart';
import 'package:admin_managerpassenger/blocs/ticket/model/ticket.dart';
import 'package:admin_managerpassenger/providers/api.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  Future<User> authenticate({
    @required String username,
    @required String password,
  }) async {
    UserLogin userLogin = UserLogin(username: username, password: password);
    Token token = await getToken(userLogin);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token.token);
    prefs.setString("name", username);
    prefs.setString("type", token.type);
    User user = User(id: 0, username: username, token: token.token);
    return user;
  }

  Future<List<UserAccount>> fetchUserAccount() async {
    List<UserAccount> useraccount = [];
    Response response =
        await Dio().get("https://managerpassenger.herokuapp.com/getuser");
    if (response != null && response.statusCode == 200) {
      var data = response.data;
      data.map((ad) => useraccount.add(UserAccount.fromJson(ad))).toList();
      return useraccount;
    }
  }

  Future<List<Car>> fetchCar() async {
    List<Car> car = [];
    Response response =
        await Dio().get("https://managerpassenger.herokuapp.com/getcar");
    if (response != null && response.statusCode == 200) {
      var data = response.data;
      data.map((ad) => car.add(Car.fromJson(ad))).toList();
      return car;
    }
  }

  Future<List<Ticket>> fetchTicketPopular() async {
    List<Ticket> ticket = [];
    Response response =
        await Dio().get("https://managerpassenger.herokuapp.com/gettourbus");
    if (response != null && response.statusCode == 200) {
      var data = response.data;
      data.map((ad) => ticket.add(Ticket.fromJson(ad))).toList();
      return ticket;
    }
  }

  Future<List<Schedule>> fetchSchedule() async {
    List<Schedule> schedule = [];
    Response response =
        await Dio().get("https://managerpassenger.herokuapp.com/getschedule");
    if (response != null && response.statusCode == 200) {
      var data = response.data;
      data.map((ad) => schedule.add(Schedule.fromJson(ad))).toList();
      return schedule;
    }
  }

  Future<List<PickUp>> fetchPickup() async {
    List<PickUp> pickup = [];
    Response response =
        await Dio().get("https://managerpassenger.herokuapp.com/getpickup");
    if (response != null && response.statusCode == 200) {
      var data = response.data;
      data.map((ad) => pickup.add(PickUp.fromJson(ad))).toList();
      return pickup;
    }
  }

  Future<List<Seat>> fetchSeat() async {
    List<Seat> seat = [];
    Response response =
        await Dio().get("https://managerpassenger.herokuapp.com/getseat");
    if (response != null && response.statusCode == 200) {
      var data = response.data;
      data.map((ad) => seat.add(Seat.fromJson(ad))).toList();
      return seat;
    }
  }

  Future<List<Discount>> fetchDiscount() async {
    List<Discount> discount = [];
    Response response =
        await Dio().get("https://managerpassenger.herokuapp.com/getdiscount");
    if (response != null && response.statusCode == 200) {
      var data = response.data;
      data.map((ad) => discount.add(Discount.fromJson(ad))).toList();
      return discount;
    }
  }

  Future<String> addUser(String email, String password, String name,
      String phone, String type) async {
    Map map = {
      "email": email,
      "password": password,
      "name": name,
      "phone": phone,
      "type": type
    };
    Response response = await Dio()
        .post("https://managerpassenger.herokuapp.com/adduser", data: map);
    if (response != null && response.statusCode == 200) {
      print("res ${response.data['success']}");
      return response.data['success'].toString();
    }
  }

  Future<String> deleteUser(String id) async {
    Map map = {"id": id};
    Response response = await Dio()
        .post("https://managerpassenger.herokuapp.com/deleteuser", data: map);
    if (response != null && response.statusCode == 200) {
      print("res ${response.data['success']}");
      return response.data['success'].toString();
    }
  }

  Future<String> deleteTicket(String id) async {
    Map map = {"id": id};
    Response response = await Dio()
        .post("https://managerpassenger.herokuapp.com/deleteticket", data: map);
    if (response != null && response.statusCode == 200) {
      print("res ${response.data['success']}");
      return response.data['success'].toString();
    }
  }

  Future<String> updateUser(String id, String email, String password,
      String name, String phone, String type) async {
    Map map = {
      "id": id,
      "email": email,
      "name": name,
      "phone": phone,
      "type": type
    };
    print(map);
    Response response = await Dio()
        .post("https://managerpassenger.herokuapp.com/updateuser", data: map);
    if (response != null && response.statusCode == 200) {
      print("res ${response.data['success']}");
      return response.data['success'].toString();
    }
  }

  Future<String> addTicket(String locationstart, String locationend,
      String time, String range, String price) async {
    Map map = {
      "locationstart": locationstart,
      "locationend": locationend,
      "time": time,
      "range": range,
      "price": price
    };
    Response response = await Dio()
        .post("https://managerpassenger.herokuapp.com/addtourbus", data: map);
    if (response != null && response.statusCode == 200) {
      print("res ${response.data['success']}");
      return response.data['success'].toString();
    }
  }

  Future<String> updateTicket(String id, String locationstart,
      String locationend, String time, String range, String price) async {
    Map map = {
      "id": id,
      "locationstart": locationstart,
      "locationend": locationend,
      "time": time,
      "range": range,
      "price": price
    };
    Response response = await Dio()
        .post("https://managerpassenger.herokuapp.com/updateticket", data: map);
    if (response != null && response.statusCode == 200) {
      print("res ${response.data['success']}");
      return response.data['success'].toString();
    }
  }

  Future<String> addSchedule(String idtour, String locationstart,
      String locationend, List<ScheduleElement> schedule) async {
    Map map = {
      "idtour": idtour,
      "locationstart": locationstart,
      "locationend": locationend,
      "schedule": schedule
    };
    print(map);
    Response response = await Dio()
        .post("https://managerpassenger.herokuapp.com/addschedule", data: map);
    if (response != null && response.statusCode == 200) {
      print("res ${response.data['success']}");
      return response.data['success'].toString();
    }
  }

  Future<String> updateSchedule(String id, String idtour, String locationstart,
      String locationend, List<ScheduleElement> schedule) async {
    Map map = {
      "id": id,
      "idtour": idtour,
      "locationstart": locationstart,
      "locationend": locationend,
      "schedule": schedule
    };
    Response response = await Dio().post(
        "https://managerpassenger.herokuapp.com/updateschedule",
        data: map);
    print("respon + ${response}");
    if (response != null && response.statusCode == 200) {
      print("res ${response.data['success']}");
      return response.data['success'].toString();
    }
  }

  Future<String> deleteSchedule(String id) async {
    Map map = {"id": id};
    Response response = await Dio().post(
        "https://managerpassenger.herokuapp.com/deleteschedule",
        data: map);
    if (response != null && response.statusCode == 200) {
      print("res ${response.data['success']}");
      return response.data['success'].toString();
    }
  }

  Future<String> addCar(
      String tourid, String driverid, String supportid, String status) async {
    Map map = {
      "driverid": driverid,
      "supportid": supportid,
      "tourid": tourid,
      "status": status
    };
    print(map);
    Response response = await Dio()
        .post("https://managerpassenger.herokuapp.com/addcar", data: map);
    if (response != null && response.statusCode == 200) {
      print("res ${response.data['success']}");
      return response.data['success'].toString();
    }
  }

  Future<String> updateCar(String id, String tourid, String driverid,
      String supportid, String status) async {
    Map map = {
      "id": id,
      "driverid": driverid,
      "supportid": supportid,
      "tourid": tourid,
      "status": status
    };
    Response response = await Dio()
        .post("https://managerpassenger.herokuapp.com/updatecar", data: map);
    print("respon + ${response}");
    if (response != null && response.statusCode == 200) {
      print("res ${response.data['success']}");
      return response.data['success'].toString();
    }
  }

  Future<String> deleteCar(String id) async {
    Map map = {"id": id};
    Response response = await Dio()
        .post("https://managerpassenger.herokuapp.com/deletecar", data: map);
    if (response != null && response.statusCode == 200) {
      print("res ${response.data['success']}");
      return response.data['success'].toString();
    }
  }

  Future<String> addPickUp(
      List<String> time, String tourid, List<Address> address) async {
    Map map = {"tourid": tourid, "time": time, "address": address};
    print(map);
    Response response = await Dio()
        .post("https://managerpassenger.herokuapp.com/addpickup", data: map);
    print("respon + ${response}");
    if (response != null && response.statusCode == 200) {
      print("res ${response.data['success']}");
      return response.data['success'].toString();
    }
  }

  Future<String> updatePickUp(List<String> time, String id, String tourid,
      List<Address> address) async {
    Map map = {"id": id, "tourid": tourid, "time": time, "address": address};
    print(map);
    Response response = await Dio()
        .post("https://managerpassenger.herokuapp.com/updatepickup", data: map);
    print("respon + ${response}");
    if (response != null && response.statusCode == 200) {
      print("res ${response.data['success']}");
      return response.data['success'].toString();
    }
  }

  Future<String> deletePickUp(String id) async {
    Map map = {"id": id};
    Response response = await Dio()
        .post("https://managerpassenger.herokuapp.com/deletepickup", data: map);
    if (response != null && response.statusCode == 200) {
      print("res ${response.data['success']}");
      return response.data['success'].toString();
    }
  }

  Future<String> addSeat(List<String> floors1, String tourid, String carid,
      List<String> floors2) async {
    Map map = {
      "idtour": tourid,
      "idcar": carid,
      "floors1": floors1,
      "floors2": floors2
    };
    print(map);
    Response response = await Dio()
        .post("https://managerpassenger.herokuapp.com/addseat", data: map);
    print("respon + ${response}");
    if (response != null && response.statusCode == 200) {
      print("res ${response.data['success']}");
      return response.data['success'].toString();
    }
  }

  Future<String> updateSeat(List<String> floors1, String tourid, String id,
      String carid, List<String> floors2) async {
    Map map = {
      "id": id,
      "idtour": tourid,
      "idcar": carid,
      "floors1": floors1,
      "floors2": floors2
    };
    print(map);
    Response response = await Dio()
        .post("https://managerpassenger.herokuapp.com/updateseat", data: map);
    print("respon + ${response}");
    if (response != null && response.statusCode == 200) {
      print("res ${response.data['success']}");
      return response.data['success'].toString();
    }
  }

  Future<String> deleteSeat(String id) async {
    Map map = {"id": id};
    Response response = await Dio()
        .post("https://managerpassenger.herokuapp.com/deleteseat", data: map);
    if (response != null && response.statusCode == 200) {
      print("res ${response.data['success']}");
      return response.data['success'].toString();
    }
  }

  Future<String> addDiscount(String title, int sale, String code,
      DateTime timestart, DateTime timeend, String description) async {
    Map map = {
      "title": title,
      "sale": sale,
      "code": code.toUpperCase(),
      "timestart": timestart.toString(),
      "timeend": timeend.toString(),
      "description": description
    };
    Response response = await Dio()
        .post("https://managerpassenger.herokuapp.com/adddiscount", data: map);
    if (response != null && response.statusCode == 200) {
      print("res ${response.data['success']}");
      return response.data['success'].toString();
    }
  }

  Future<String> updateDiscount(String id, String title, int sale, String code,
      DateTime timestart, DateTime timeend, String description) async {
    Map map = {
      "id": id,
      "title": title,
      "sale": sale,
      "code": code.toUpperCase(),
      "timestart": timestart.toString(),
      "timeend": timeend.toString(),
      "description": description
    };
    print(map);
    Response response = await Dio().post(
        "https://managerpassenger.herokuapp.com/updatediscount",
        data: map);
    print("update + ${response}");
    if (response != null && response.statusCode == 200) {
      print("res ${response.data['success']}");
      return response.data['success'].toString();
    }
  }

  Future<String> deleteDiscount(String id) async {
    Map map = {"id": id};
    Response response = await Dio().post(
        "https://managerpassenger.herokuapp.com/deletediscount",
        data: map);
    if (response != null && response.statusCode == 200) {
      print("res ${response.data['success']}");
      return response.data['success'].toString();
    }
  }
}
