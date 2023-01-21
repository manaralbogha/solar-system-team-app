import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system_team/layout/home_solar_system_team_screen/cubit/states.dart';
import 'package:solar_system_team/shared/const/const.dart';
import 'package:solar_system_team/shared/network/remote/dio_helper.dart';

import '../../../models/model_get_appointment_team.dart';
import '../../../models/model_get_order_by_id.dart';
import '../../../models/model_product_for_company.dart';

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

  ProductForCompanyModel? allProductsByCompanyId;
  List<CompanyProducts>? panel = [];
  List<CompanyProducts>? batter = [];
  List<CompanyProducts>? inverter = [];
  List<CompanyProducts>? generator = [];
  List<CompanyProducts>? otherProducts = [];

  void getProductsForCompanyId({
    required String token,
    required int idCompany,
  }) {
    print(idCompany);
    emit(GetCategoryForProductIdLoadingState());

    DioHelper.getData(url: '$endPoint/company/productID', token: token, query: {
      'company_id': idCompany,
    }).then((value) async {
      allProductsByCompanyId = ProductForCompanyModel.fromJson(value.data);
      filterProductsByCompanyId(idCompany: idCompany);
      //  print(value.data);
      // print(panel);
      // print(batter);
      // print(inverter);
      // print(generator);
      print(otherProducts);

      emit(
        GetCategoryForProductIdSuccessState(
            panel: panel,
            batter: batter,
            inverter: inverter,
            generator: generator),
      );
    }).catchError((error) {
      emit(GetCategoryForProductIdErrorsState());
    });
  }

  void filterProductsByCompanyId({
    required int idCompany,
  }) {
    allProductsByCompanyId!.data![0].products.forEach(
      (element) {
        if (element.categore!.id == 2) {
          panel!.add(element);
        } else if (element.categore!.id == 3) {
          inverter!.add(element);
        } else if (element.categore!.id == 4) {
          batter!.add(element);
        } else if (element.categore!.id == 5) {
          generator!.add(element);
        } else {
          otherProducts!.add(element);
        }
      },
    );
  }
}
