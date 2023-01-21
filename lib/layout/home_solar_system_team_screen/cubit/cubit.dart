import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system_team/layout/home_solar_system_team_screen/cubit/states.dart';
import 'package:solar_system_team/shared/const/const.dart';
import 'package:solar_system_team/shared/network/remote/dio_helper.dart';

import '../../../models/model_get_appointment_team.dart';
import '../../../models/model_get_order_by_id.dart';

class HomeSolarSystemTeamCubit extends Cubit<HomeSolarSystemTeamStates> {
  HomeSolarSystemTeamCubit() : super(HomeSolarSystemTeamInitialState());
  static HomeSolarSystemTeamCubit get(context) => BlocProvider.of(context);

  GetAppointmentTeamModel? teamAppointment;
  void appointmentTeam({
    required String token,
  }) {
    emit(AppointmentTeamLoadingState());
    DioHelper.getData(url: "$endPoint/appointment/team", token: token)
        .then((value) {
      print(value.data);
      teamAppointment = GetAppointmentTeamModel.fromJson(value.data);
      print(teamAppointment!.data!.length);
      emit(AppointmentTeamSuccessState());
    }).catchError((error) {
      print(error.toString);
      emit(AppointmentTeamErrorsState());
    });
  }

  OrderByIdModel? orderById;
  void showDetails() {
    emit(ShowDetailsState());
  }

  void getOrderById({
    required String token,
    required int? idOrder,
  }) {
    emit(ShowDetailsLoadingState());
    DioHelper.getData(url: "$endPoint/order/show/$idOrder", token: token)
        .then((value) {
      print(value.data);
      orderById = OrderByIdModel.fromJson(value.data);
      print(orderById!.data!.user!.phone);
      emit(ShowDetailsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ShowDetailsErrorsState());
    });
  }
}
