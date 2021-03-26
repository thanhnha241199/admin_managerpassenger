part of 'admin_bloc.dart';

class AdminState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AdminInitialState extends AdminState {}

class LoadingState extends AdminState {}

class AddLoadingState extends AdminState {}

class SuccessState extends AdminState {
  List<UserAccount> useraccount;
  List<Car> car;
  List<Ticket> ticket;
  List<Schedule> schedule;
  List<PickUp> pickup;
  List<Seat> seat;
  List<Discount> discount;
  SuccessState(
      {this.useraccount,
      this.ticket,
      this.schedule,
      this.car,
      this.pickup,
      this.seat,
      this.discount});
}

class FailureState extends AdminState {
  String msg;

  FailureState({this.msg});
}
