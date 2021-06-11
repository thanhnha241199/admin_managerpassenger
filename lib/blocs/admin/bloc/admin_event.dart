part of 'admin_bloc.dart';

class AdminEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class DoFetchUserEvent extends AdminEvent {}

class AddUserEvent extends AdminEvent {
  final String email;
  final String password;
  final String name;
  final String phone;
  final String type;

  AddUserEvent(
      {@required this.email,
      @required this.password,
      @required this.name,
      @required this.phone,
      @required this.type});
}

class UpdateUserEvent extends AdminEvent {
  final String id;
  final String email;
  final String password;
  final String name;
  final String active;
  final String phone;
  final String type;

  UpdateUserEvent(
      {@required this.id,
      @required this.email,
      @required this.password,
      @required this.name,
      @required this.active,
      @required this.phone,
      @required this.type});
}

class AddTicketEvent extends AdminEvent {
  final String locationstart;
  final String locationend;
  final String range;
  final String price;
  final String time;
  String carid;
  String driverid;
  String shutle;
  String supporttid;

  AddTicketEvent(
      {@required this.locationstart,
      @required this.locationend,
      @required this.range,
      @required this.price,
      @required this.time,
      this.carid,
      this.driverid,
      this.shutle,
      this.supporttid});
}

class UpdateTicketEvent extends AdminEvent {
  final String id;
  final String locationstart;
  final String locationend;
  final String range;
  final String price;
  final String shuttle;
  final String driverid;

  final String supportid;
  final String time;
  final String carid;

  UpdateTicketEvent({
    @required this.id,
    @required this.locationstart,
    @required this.locationend,
    @required this.range,
    @required this.price,
    @required this.shuttle,
    @required this.driverid,
    @required this.supportid,
    @required this.time,
    @required this.carid,
  });
}

class DeleteUserEvent extends AdminEvent {
  final String id;

  DeleteUserEvent({@required this.id});
}

class DeleteTicketEvent extends AdminEvent {
  final String id;

  DeleteTicketEvent({@required this.id});
}

class AddScheduleEvent extends AdminEvent {
  final String idtour;
  final String locationstart;
  final String locationend;
  final List<ScheduleElement> schedule;

  AddScheduleEvent(
      {@required this.idtour,
      @required this.locationstart,
      @required this.locationend,
      @required this.schedule});
}

class UpdateScheduleEvent extends AdminEvent {
  final String id;
  final String idtour;
  final String locationstart;
  final String locationend;
  final List<ScheduleElement> schedule;

  UpdateScheduleEvent(
      {@required this.id,
      @required this.idtour,
      @required this.locationstart,
      @required this.locationend,
      @required this.schedule});
}

class DeleteScheduleEvent extends AdminEvent {
  final String id;

  DeleteScheduleEvent({@required this.id});
}

class AddCarEvent extends AdminEvent {
  final String tourid;
  final String name;
  final String numberplate;
  final String status;
  final String driverid;
  final String supportid;
  final String description;

  AddCarEvent(
      {@required this.tourid,
      @required this.name,
      @required this.description,
      @required this.numberplate,
      @required this.driverid,
      @required this.supportid,
      @required this.status});
}

class UpdateCarEvent extends AdminEvent {
  final String id;
  final String tourid;
  final String name;
  final String numberplate;
  final String status;
  final String driverid;
  final String supportid;
  final String description;

  UpdateCarEvent(
      {@required this.id,
      @required this.tourid,
      @required this.name,
      @required this.description,
      @required this.numberplate,
      @required this.driverid,
      @required this.supportid,
      @required this.status});
}

class DeleteCarEvent extends AdminEvent {
  final String id;

  DeleteCarEvent({@required this.id});
}

class UpdatePickUpEvent extends AdminEvent {
  final List<String> time;
  final String id;
  final String tourid;
  final List<Address> address;

  UpdatePickUpEvent(
      {@required this.id,
      @required this.time,
      @required this.tourid,
      @required this.address});
}

class AddPickUpEvent extends AdminEvent {
  final List<String> time;
  final String tourid;
  final List<Address> address;

  AddPickUpEvent(
      {@required this.time, @required this.tourid, @required this.address});
}

class DeletePickUpEvent extends AdminEvent {
  final String id;

  DeletePickUpEvent({@required this.id});
}

class AddSeatEvent extends AdminEvent {
  final List<String> floors1;
  final String tourid;
  final String carid;
  final List<String> floors2;

  AddSeatEvent(
      {@required this.floors1,
      @required this.tourid,
      @required this.carid,
      @required this.floors2});
}

class UpdateSeatEvent extends AdminEvent {
  final List<String> floors1;
  final String tourid;
  final String id;
  final String carid;
  final List<String> floors2;

  UpdateSeatEvent(
      {@required this.floors1,
      @required this.tourid,
      @required this.id,
      @required this.carid,
      @required this.floors2});
}

class DeleteSeatEvent extends AdminEvent {
  final String id;

  DeleteSeatEvent({@required this.id});
}

class AddDiscountEvent extends AdminEvent {
  final String title;
  final int sale;
  final String code;
  final DateTime timestart;
  final DateTime timeend;
  final String description;

  AddDiscountEvent(
      {@required this.title,
      @required this.sale,
      @required this.code,
      @required this.timestart,
      @required this.timeend,
      @required this.description});
}

class UpdateDiscountEvent extends AdminEvent {
  final String id;
  final String title;
  final int sale;
  final String code;
  final DateTime timestart;
  final DateTime timeend;
  final String description;

  UpdateDiscountEvent(
      {@required this.id,
      @required this.title,
      @required this.sale,
      @required this.code,
      @required this.timestart,
      @required this.timeend,
      @required this.description});
}

class DeleteDiscountEvent extends AdminEvent {
  final String id;

  DeleteDiscountEvent({@required this.id});
}
