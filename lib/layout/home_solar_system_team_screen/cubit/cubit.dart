import 'package:flutter/material.dart';
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
  List<Map<String, dynamic>> listDeviceMap = [];
  List<Map<String, dynamic>> listProductsMap = [];
  GetAppointmentTeamModel? teamAppointment;
  bool isAddOtherProduct = false;
  var installationDayController = TextEditingController();

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
  List<Product> allProductCompany = [];

  void getProductsForCompanyId({
    required String token,
    required int idCompany,
  }) {
    print(idCompany);
    emit(GetCategoryForProductIdLoadingState());

    DioHelper.getData(url: '$endPoint/company/productID', token: token, query: {
      'company_id': idCompany,
    }).then((value) {
      // print(value.data);
      allProductsByCompanyId = ProductForCompanyModel.fromJson(value.data);
      // print(allProductsByCompanyId!.data![0].products.length);
      allProductCompany = [];
      value.data['data'][0]["products"].forEach((element) {
        allProductCompany.add(Product.fromJson(element));
      });
      print(allProductCompany.length);

      filterProductsByCompanyId(idCompany: idCompany);
      //  print(value.data);
      // print(panel);
      // print(batter);
      // print(inverter);
      // print(generator);
      //  print(otherProducts);

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

  void productChange({
    required int? idGeneralProduct,
    required CompanyProducts companyProducts,
  }) {
    orderById!.data!.products!.forEach((element) {
      if (element.product!.categore!.id == companyProducts.categore!.id) {
        element.product!.image = companyProducts.image;
        element.product!.name = companyProducts.name;
        element.product!.price = companyProducts.price;
        //  element.product!.features = companyProducts.features as List<CompanyFeatures>;
        element.productAmmount = companyProducts.quantity;
        element.product!.id = companyProducts.id;
        element.id = companyProducts.id;
        element.product!.available = companyProducts.available;
        element.product!.categore!.id = companyProducts.categore!.id;
        element.product!.categore!.name = companyProducts.categore!.name;
        element.product!.features!.forEach((element) {
          companyProducts.features!.forEach((element1) {
            if (element.name == element1.name) {
              element.id = element1.id;
              element.name = element1.name;
              element.suffix = element1.suffix;
              element.type = element1.type;
              element.value = element1.value;
            }
          });
        });
      }
    });
    emit(ProductChange());
  }

  void showProductForChange(Products product) {
    product.product!.showProducts = !product.product!.showProducts;

    print(product.product!.showProducts);
    emit(ShowProductForChange());
  }

  void addProductsToMap(
    List<Products> productsSelected,
  ) {
    listProductsMap = [];
    for (var element in productsSelected) {
      listProductsMap.add({
        "product_id": element.id,
        "ammount": element.productAmmount,
      });
    }
    print(listProductsMap.toList());
  }

  void addDevicesToMap(
    List<Devices> deviceCheck,
  ) {
    listDeviceMap = [];
    for (var element in deviceCheck) {
      listDeviceMap.add({
        "device_id": element.id,
        "ammount": element.deviceAmmount,
      });
    }

    print(listDeviceMap.toString());
  }

  void updateOrder({
    required int idOrder,
    required String token,
    required String totalVoltage,
    required String totalPrice,
    required String hoursOnCharge,
    required String hoursOnBattery,
    required String space,
    required double lat,
    required double long,
    required String area,
    required List<Map<String, dynamic>> products,
    required List<Map<String, dynamic>> devices,
  }) {
    DioHelper.putData(
      url: "$endPoint/order/update/$idOrder",
      data: {
        "order": {
          "total_voltage": totalVoltage,
          "total_price": totalPrice,
          "hours_on_charge": hoursOnCharge,
          "hours_on_bettary": hoursOnBattery,
          "space": space,
          "lat": lat,
          "long": long,
          "area": area
        },
        "products": products,
        "devices": devices,
      },
      token: token,
    ).then((value) {
      print(value.data);
    }).catchError((error) {
      print(error.toString());
    });
  }

  void addAmount(Products product) {
    product.productAmmount += 1;
    print(product.productAmmount);
    emit(AddAmount());
  }

  void minusAmount(Products product) {
    if (product.productAmmount > 1) {
      product.productAmmount -= 1;
      print(product.productAmmount);
      emit(MinusAmount());
    }
  }

  void addOtherProduct() {
    isAddOtherProduct = !isAddOtherProduct;
    emit(AddOtherProduct());
  }

  void deleteProductsFromOrder(Products product) {
    orderById!.data!.products!
        .removeWhere((element) => element.id == product.id);
    emit(DeleteProductsFromOrder());
  }

  void installationAppointment(
      {required String token,
      required int installationDays,
      required int idOrder}) {
    emit(InstallationAppointmentLoadingState());
    DioHelper.postData(
            url: '$endPoint/appointment/installation/$idOrder',
            data: {
              'days': installationDays,
            },
            token: token)
        .then((value) {
      print(value.data);
      emit(InstallationAppointmentSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(InstallationAppointmentErrorsState());
    });
  }

  void orderStatus(
      {required String token, required String status, required int idOrder}) {
    DioHelper.postData(
            url: '$endPoint/appointment/OrderStatus/$idOrder?',
            data: {},
            query: {'status': status},
            token: token)
        .then((value) {
      print(value.data);
    }).catchError((error) {
      print(error.toString());
    });
  }

  // void location(double lat, double lng) {
  //   DioHelper.getData(
  //           url:
  //               'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=AIzaSyAQv95_r6j28m9Rnu65oC8l_F71fYGcK_8')
  //       .then((value) {
  //     print(value.data);
  //   }).catchError((onError) {
  //     print(onError.toString());
  //   });
  // }

  // Future<http.Response> getLocationInfo(double lat, double lng) async {
  //   final String url =
  //       'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=YOUR_API_KEY';

  //   final response = await http.get(url);

  //   if (response.statusCode == 200) {
  //     return response;
  //   } else {
  //     throw Exception('Failed to get location information');
  //   }
  // }
}
