import 'package:admin_managerpassenger/blocs/admin/model/user_account.dart';
import 'package:admin_managerpassenger/blocs/car/model/car.dart';
import 'package:admin_managerpassenger/blocs/order/model/rental_model.dart';
import 'package:admin_managerpassenger/blocs/order/model/ticket_model.dart';
import 'package:admin_managerpassenger/blocs/ticket/model/pickup.dart';
import 'package:admin_managerpassenger/blocs/ticket/model/discount.dart';
import 'package:admin_managerpassenger/blocs/ticket/model/schedule.dart';
import 'package:admin_managerpassenger/blocs/ticket/model/seat.dart';
import 'package:admin_managerpassenger/blocs/ticket/model/ticket.dart';
import 'package:admin_managerpassenger/repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'admin_event.dart';

part 'admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  final UserRepository userRepository;

  AdminBloc(AdminState initialState, this.userRepository) : super(initialState);

  @override
  Stream<AdminState> mapEventToState(AdminEvent adminEvent) async* {
    // TODO: implement mapEventToState
    if (adminEvent is DoFetchUserEvent) {
      try {
        yield LoadingState();
        var useraccount = await userRepository.fetchUserAccount();
        print("Account ${useraccount}");
        var car = await userRepository.fetchCar();
        print("car ${car}");
        var ticket = await userRepository.fetchTicketPopular();
        print("ticket ${ticket}");
        var schedule = await userRepository.fetchSchedule();
        print("schedule ${schedule}");
        var pickup = await userRepository.fetchPickup();
        print("pickup ${pickup}");
        var seat = await userRepository.fetchSeat();
        print("seat ${seat}");
        var discount = await userRepository.fetchDiscount();
        print("discount ${discount}");
        var ticketorder = await userRepository.fetchOrderTicket();
        print("ticketorder ${ticketorder}");
        // var rental = await userRepository.fetchOrderRental();
        //  print("rental ${rental}");
        yield SuccessState(
          useraccount: useraccount,
          ticket: ticket,
          schedule: schedule,
          car: car,
          pickup: pickup,
          discount: discount,
          seat: seat,
          ticketorder: ticketorder,
          // rental: rental
        );
      } catch (e) {
        print(e.toString());
        yield FailureState(msg: e.toString());
      }
    }

    if (adminEvent is AddUserEvent) {
      try {
        yield AddLoadingState();
        var msg = await userRepository.addUser(
            adminEvent.email,
            adminEvent.password,
            adminEvent.name,
            adminEvent.phone,
            adminEvent.type);
        if (msg == "true") {
          yield SuccessState();
          yield LoadingState();
          var useraccount = await userRepository.fetchUserAccount();
          var car = await userRepository.fetchCar();
          var ticket = await userRepository.fetchTicketPopular();
          var schedule = await userRepository.fetchSchedule();
          yield SuccessState(
              useraccount: useraccount,
              ticket: ticket,
              schedule: schedule,
              car: car);
        } else {
          yield FailureState(msg: "error");
        }
      } catch (e) {
        yield FailureState(msg: e.toString());
      }
    }

    if (adminEvent is DeleteUserEvent) {
      try {
        yield AddLoadingState();
        var msg = await userRepository.deleteUser(adminEvent.id);
        if (msg == "true") {
          yield SuccessState();
          yield LoadingState();
          var useraccount = await userRepository.fetchUserAccount();
          var car = await userRepository.fetchCar();
          var ticket = await userRepository.fetchTicketPopular();
          var schedule = await userRepository.fetchSchedule();
          yield SuccessState(
              useraccount: useraccount,
              ticket: ticket,
              schedule: schedule,
              car: car);
        } else {
          yield FailureState(msg: "error");
        }
      } catch (e) {
        yield FailureState(msg: e.toString());
      }
    }

    if (adminEvent is UpdateUserEvent) {
      try {
        yield AddLoadingState();
        var msg = await userRepository.updateUser(
            adminEvent.id,
            adminEvent.email,
            adminEvent.password,
            adminEvent.name,
            adminEvent.phone,
            adminEvent.type,
            adminEvent.active);
        if (msg == "true") {
          yield SuccessState();
          yield LoadingState();
          var useraccount = await userRepository.fetchUserAccount();
          var car = await userRepository.fetchCar();
          var ticket = await userRepository.fetchTicketPopular();
          var schedule = await userRepository.fetchSchedule();
          yield SuccessState(
              useraccount: useraccount,
              ticket: ticket,
              schedule: schedule,
              car: car);
        } else {
          yield FailureState(msg: "error");
        }
      } catch (e) {
        yield FailureState(msg: e.toString());
      }
    }

    if (adminEvent is AddTicketEvent) {
      try {
        yield AddLoadingState();
        var msg = await userRepository.addTicket(
            adminEvent.locationstart,
            adminEvent.locationend,
            adminEvent.time,
            adminEvent.range,
            adminEvent.price,
            adminEvent.carid,
            adminEvent.driverid,
            adminEvent.shutle,
            adminEvent.supporttid);
        if (msg == "true") {
          yield SuccessState();
          yield LoadingState();
          var useraccount = await userRepository.fetchUserAccount();
          var car = await userRepository.fetchCar();
          var ticket = await userRepository.fetchTicketPopular();
          var schedule = await userRepository.fetchSchedule();
          yield SuccessState(
              useraccount: useraccount,
              ticket: ticket,
              schedule: schedule,
              car: car);
        } else {
          yield FailureState(msg: "error");
        }
      } catch (e) {
        yield FailureState(msg: e.toString());
      }
    }

    if (adminEvent is UpdateTicketEvent) {
      try {
        yield AddLoadingState();
        var msg = await userRepository.updateTicket(
          adminEvent.id,
          adminEvent.locationstart,
          adminEvent.locationend,
          adminEvent.time,
          adminEvent.range,
          adminEvent.price,
          adminEvent.driverid,
          adminEvent.supportid,
          adminEvent.shuttle,
          adminEvent.carid,
        );
        if (msg == "true") {
          yield SuccessState();
          yield LoadingState();
          var useraccount = await userRepository.fetchUserAccount();
          var car = await userRepository.fetchCar();
          var ticket = await userRepository.fetchTicketPopular();
          var schedule = await userRepository.fetchSchedule();
          yield SuccessState(
              useraccount: useraccount,
              ticket: ticket,
              schedule: schedule,
              car: car);
        } else {
          yield FailureState(msg: "error");
        }
      } catch (e) {
        yield FailureState(msg: e.toString());
      }
    }

    if (adminEvent is DeleteTicketEvent) {
      try {
        yield AddLoadingState();
        var msg = await userRepository.deleteTicket(adminEvent.id);
        if (msg == "true") {
          yield SuccessState();
          yield LoadingState();
          var useraccount = await userRepository.fetchUserAccount();
          var car = await userRepository.fetchCar();
          var ticket = await userRepository.fetchTicketPopular();
          var schedule = await userRepository.fetchSchedule();
          yield SuccessState(
              useraccount: useraccount,
              ticket: ticket,
              schedule: schedule,
              car: car);
        } else {
          yield FailureState(msg: "error");
        }
      } catch (e) {
        yield FailureState(msg: e.toString());
      }
    }

    if (adminEvent is AddScheduleEvent) {
      try {
        yield AddLoadingState();
        var msg = await userRepository.addSchedule(
            adminEvent.idtour,
            adminEvent.locationstart,
            adminEvent.locationend,
            adminEvent.schedule);
        if (msg == "true") {
          yield SuccessState();
          yield LoadingState();
          var useraccount = await userRepository.fetchUserAccount();
          var car = await userRepository.fetchCar();
          var ticket = await userRepository.fetchTicketPopular();
          var schedule = await userRepository.fetchSchedule();
          yield SuccessState(
              useraccount: useraccount,
              ticket: ticket,
              schedule: schedule,
              car: car);
        } else {
          yield FailureState(msg: "error");
        }
      } catch (e) {
        yield FailureState(msg: e.toString());
      }
    }

    if (adminEvent is UpdateScheduleEvent) {
      try {
        yield AddLoadingState();
        var msg = await userRepository.updateSchedule(
            adminEvent.id,
            adminEvent.idtour,
            adminEvent.locationstart,
            adminEvent.locationend,
            adminEvent.schedule);
        if (msg == "true") {
          yield SuccessState();
          yield LoadingState();
          var useraccount = await userRepository.fetchUserAccount();
          var car = await userRepository.fetchCar();
          var ticket = await userRepository.fetchTicketPopular();
          var schedule = await userRepository.fetchSchedule();
          yield SuccessState(
              useraccount: useraccount,
              ticket: ticket,
              schedule: schedule,
              car: car);
        } else {
          yield FailureState(msg: "error");
        }
      } catch (e) {
        yield FailureState(msg: e.toString());
      }
    }

    if (adminEvent is DeleteScheduleEvent) {
      try {
        yield AddLoadingState();
        var msg = await userRepository.deleteSchedule(adminEvent.id);
        if (msg == "true") {
          yield SuccessState();
          yield LoadingState();
          var useraccount = await userRepository.fetchUserAccount();
          var car = await userRepository.fetchCar();
          var ticket = await userRepository.fetchTicketPopular();
          var schedule = await userRepository.fetchSchedule();
          yield SuccessState(
              useraccount: useraccount,
              ticket: ticket,
              schedule: schedule,
              car: car);
        } else {
          yield FailureState(msg: "error");
        }
      } catch (e) {
        yield FailureState(msg: e.toString());
      }
    }

    if (adminEvent is AddCarEvent) {
      try {
        yield AddLoadingState();
        var msg = await userRepository.addCar(
            adminEvent.tourid,
            adminEvent.name,
            adminEvent.numberplate,
            adminEvent.status,
            adminEvent.driverid,
            adminEvent.supportid,
            adminEvent.description);
        if (msg == "true") {
          yield SuccessState();
          yield LoadingState();
          var useraccount = await userRepository.fetchUserAccount();
          var car = await userRepository.fetchCar();
          var ticket = await userRepository.fetchTicketPopular();
          var schedule = await userRepository.fetchSchedule();
          yield SuccessState(
              useraccount: useraccount,
              ticket: ticket,
              schedule: schedule,
              car: car);
        } else {
          yield FailureState(msg: "error");
        }
      } catch (e) {
        yield FailureState(msg: e.toString());
      }
    }

    if (adminEvent is UpdateCarEvent) {
      try {
        yield AddLoadingState();
        var msg = await userRepository.updateCar(
            adminEvent.id,
            adminEvent.tourid,
            adminEvent.name,
            adminEvent.numberplate,
            adminEvent.status,
            adminEvent.driverid,
            adminEvent.supportid,
            adminEvent.description);
        if (msg == "true") {
          yield SuccessState();
          yield LoadingState();
          var useraccount = await userRepository.fetchUserAccount();
          var car = await userRepository.fetchCar();
          var ticket = await userRepository.fetchTicketPopular();
          var schedule = await userRepository.fetchSchedule();
          yield SuccessState(
              useraccount: useraccount,
              ticket: ticket,
              schedule: schedule,
              car: car);
        } else {
          yield FailureState(msg: "error");
        }
      } catch (e) {
        yield FailureState(msg: e.toString());
      }
    }

    if (adminEvent is DeleteCarEvent) {
      try {
        yield AddLoadingState();
        var msg = await userRepository.deleteCar(adminEvent.id);
        if (msg == "true") {
          yield SuccessState();
          yield LoadingState();
          var useraccount = await userRepository.fetchUserAccount();
          var car = await userRepository.fetchCar();
          var ticket = await userRepository.fetchTicketPopular();
          var schedule = await userRepository.fetchSchedule();
          yield SuccessState(
              useraccount: useraccount,
              ticket: ticket,
              schedule: schedule,
              car: car);
        } else {
          yield FailureState(msg: "error");
        }
      } catch (e) {
        yield FailureState(msg: e.toString());
      }
    }

    if (adminEvent is AddPickUpEvent) {
      try {
        yield AddLoadingState();
        var msg = await userRepository.addPickUp(
            adminEvent.time, adminEvent.tourid, adminEvent.address);
        if (msg == "true") {
          yield SuccessState();
          yield LoadingState();
          var useraccount = await userRepository.fetchUserAccount();
          var car = await userRepository.fetchCar();
          var ticket = await userRepository.fetchTicketPopular();
          var schedule = await userRepository.fetchSchedule();
          var pickup = await userRepository.fetchPickup();
          yield SuccessState(
              useraccount: useraccount,
              ticket: ticket,
              schedule: schedule,
              car: car,
              pickup: pickup);
        } else {
          yield FailureState(msg: "error");
        }
      } catch (e) {
        yield FailureState(msg: e.toString());
      }
    }

    if (adminEvent is UpdatePickUpEvent) {
      try {
        yield AddLoadingState();
        var msg = await userRepository.updatePickUp(adminEvent.time,
            adminEvent.id, adminEvent.tourid, adminEvent.address);
        if (msg == "true") {
          yield SuccessState();
          yield LoadingState();
          var useraccount = await userRepository.fetchUserAccount();
          var car = await userRepository.fetchCar();
          var ticket = await userRepository.fetchTicketPopular();
          var schedule = await userRepository.fetchSchedule();
          var pickup = await userRepository.fetchPickup();
          yield SuccessState(
              useraccount: useraccount,
              ticket: ticket,
              schedule: schedule,
              car: car,
              pickup: pickup);
        } else {
          yield FailureState(msg: "error");
        }
      } catch (e) {
        yield FailureState(msg: e.toString());
      }
    }

    if (adminEvent is DeletePickUpEvent) {
      try {
        yield AddLoadingState();
        var msg = await userRepository.deletePickUp(adminEvent.id);
        if (msg == "true") {
          yield SuccessState();
          yield LoadingState();
          var useraccount = await userRepository.fetchUserAccount();
          var car = await userRepository.fetchCar();
          var ticket = await userRepository.fetchTicketPopular();
          var schedule = await userRepository.fetchSchedule();
          var pickup = await userRepository.fetchPickup();
          yield SuccessState(
              useraccount: useraccount,
              ticket: ticket,
              schedule: schedule,
              car: car,
              pickup: pickup);
        } else {
          yield FailureState(msg: "error");
        }
      } catch (e) {
        yield FailureState(msg: e.toString());
      }
    }

    if (adminEvent is AddSeatEvent) {
      try {
        yield AddLoadingState();
        var msg = await userRepository.addSeat(adminEvent.floors1,
            adminEvent.tourid, adminEvent.carid, adminEvent.floors2);
        if (msg == "true") {
          yield SuccessState();
          yield LoadingState();
          var useraccount = await userRepository.fetchUserAccount();
          var car = await userRepository.fetchCar();
          var ticket = await userRepository.fetchTicketPopular();
          var schedule = await userRepository.fetchSchedule();
          var pickup = await userRepository.fetchPickup();
          var seat = await userRepository.fetchSeat();
          yield SuccessState(
              useraccount: useraccount,
              ticket: ticket,
              schedule: schedule,
              car: car,
              pickup: pickup,
              seat: seat);
        } else {
          yield FailureState(msg: "error");
        }
      } catch (e) {
        yield FailureState(msg: e.toString());
      }
    }
    if (adminEvent is UpdateSeatEvent) {
      try {
        yield AddLoadingState();
        var msg = await userRepository.updateSeat(
            adminEvent.floors1,
            adminEvent.tourid,
            adminEvent.id,
            adminEvent.carid,
            adminEvent.floors2);
        if (msg == "true") {
          yield SuccessState();
          yield LoadingState();
          var useraccount = await userRepository.fetchUserAccount();
          var car = await userRepository.fetchCar();
          var ticket = await userRepository.fetchTicketPopular();
          var schedule = await userRepository.fetchSchedule();
          var pickup = await userRepository.fetchPickup();
          var seat = await userRepository.fetchSeat();
          yield SuccessState(
              useraccount: useraccount,
              ticket: ticket,
              schedule: schedule,
              car: car,
              pickup: pickup,
              seat: seat);
        } else {
          yield FailureState(msg: "error");
        }
      } catch (e) {
        yield FailureState(msg: e.toString());
      }
    }
    if (adminEvent is DeleteSeatEvent) {
      try {
        yield AddLoadingState();
        var msg = await userRepository.deleteSeat(adminEvent.id);
        if (msg == "true") {
          yield SuccessState();
          yield LoadingState();
          var useraccount = await userRepository.fetchUserAccount();
          var car = await userRepository.fetchCar();
          var ticket = await userRepository.fetchTicketPopular();
          var schedule = await userRepository.fetchSchedule();
          var pickup = await userRepository.fetchPickup();
          var seat = await userRepository.fetchSeat();
          yield SuccessState(
              useraccount: useraccount,
              ticket: ticket,
              schedule: schedule,
              car: car,
              pickup: pickup,
              seat: seat);
        } else {
          yield FailureState(msg: "error");
        }
      } catch (e) {
        yield FailureState(msg: e.toString());
      }
    }

    if (adminEvent is UpdateDiscountEvent) {
      try {
        yield AddLoadingState();
        var msg = await userRepository.updateDiscount(
            adminEvent.id,
            adminEvent.title,
            adminEvent.sale,
            adminEvent.code,
            adminEvent.timestart,
            adminEvent.timeend,
            adminEvent.description);
        if (msg == "true") {
          yield SuccessState();
          yield LoadingState();
          var useraccount = await userRepository.fetchUserAccount();
          var car = await userRepository.fetchCar();
          var ticket = await userRepository.fetchTicketPopular();
          var schedule = await userRepository.fetchSchedule();
          var pickup = await userRepository.fetchPickup();
          var seat = await userRepository.fetchSeat();
          var discount = await userRepository.fetchDiscount();
          yield SuccessState(
              useraccount: useraccount,
              ticket: ticket,
              schedule: schedule,
              car: car,
              pickup: pickup,
              discount: discount,
              seat: seat);
        } else {
          yield FailureState(msg: "error");
        }
      } catch (e) {
        yield FailureState(msg: e.toString());
      }
    }

    if (adminEvent is AddDiscountEvent) {
      try {
        yield AddLoadingState();
        var msg = await userRepository.addDiscount(
            adminEvent.title,
            adminEvent.sale,
            adminEvent.code,
            adminEvent.timestart,
            adminEvent.timeend,
            adminEvent.description);
        if (msg == "true") {
          yield SuccessState();
          yield LoadingState();
          var useraccount = await userRepository.fetchUserAccount();
          var car = await userRepository.fetchCar();
          var ticket = await userRepository.fetchTicketPopular();
          var schedule = await userRepository.fetchSchedule();
          var pickup = await userRepository.fetchPickup();
          var seat = await userRepository.fetchSeat();
          var discount = await userRepository.fetchDiscount();
          yield SuccessState(
              useraccount: useraccount,
              ticket: ticket,
              schedule: schedule,
              car: car,
              pickup: pickup,
              discount: discount,
              seat: seat);
        } else {
          yield FailureState(msg: "error");
        }
      } catch (e) {
        yield FailureState(msg: e.toString());
      }
    }
    if (adminEvent is DeleteDiscountEvent) {
      try {
        yield AddLoadingState();
        var msg = await userRepository.deleteDiscount(adminEvent.id);
        if (msg == "true") {
          yield SuccessState();
          yield LoadingState();
          var useraccount = await userRepository.fetchUserAccount();
          var car = await userRepository.fetchCar();
          var ticket = await userRepository.fetchTicketPopular();
          var schedule = await userRepository.fetchSchedule();
          var pickup = await userRepository.fetchPickup();
          var seat = await userRepository.fetchSeat();
          var discount = await userRepository.fetchDiscount();
          yield SuccessState(
              useraccount: useraccount,
              ticket: ticket,
              schedule: schedule,
              car: car,
              pickup: pickup,
              discount: discount,
              seat: seat);
        } else {
          yield FailureState(msg: "error");
        }
      } catch (e) {
        yield FailureState(msg: e.toString());
      }
    }
  }
}
