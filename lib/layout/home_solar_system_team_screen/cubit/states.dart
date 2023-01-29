import '../../../models/model_product_for_company.dart';

abstract class HomeSolarSystemTeamStates {}

class HomeSolarSystemTeamInitialState extends HomeSolarSystemTeamStates {}

class AppointmentTeamLoadingState extends HomeSolarSystemTeamStates {}

class AppointmentTeamSuccessState extends HomeSolarSystemTeamStates {}

class AppointmentTeamErrorsState extends HomeSolarSystemTeamStates {}

class ShowDetailsState extends HomeSolarSystemTeamStates {}

class ShowDetailsLoadingState extends HomeSolarSystemTeamStates {}

class ShowDetailsSuccessState extends HomeSolarSystemTeamStates {}

class ShowDetailsErrorsState extends HomeSolarSystemTeamStates {}

class GetCategoryForProductIdLoadingState extends HomeSolarSystemTeamStates {}

class GetCategoryForProductIdSuccessState extends HomeSolarSystemTeamStates {
  List<CompanyProducts>? panel;
  List<CompanyProducts>? batter;
  List<CompanyProducts>? inverter;
  List<CompanyProducts>? generator;
  GetCategoryForProductIdSuccessState(
      {required this.panel,
      required this.batter,
      required this.inverter,
      required this.generator});
}

class GetCategoryForProductIdErrorsState extends HomeSolarSystemTeamStates {}

class ShowProductForChange extends HomeSolarSystemTeamStates {}

class ProductChange extends HomeSolarSystemTeamStates {}

class AddAmount extends HomeSolarSystemTeamStates {}

class MinusAmount extends HomeSolarSystemTeamStates {}

class AddOtherProduct extends HomeSolarSystemTeamStates {}

class DeleteProductsFromOrder extends HomeSolarSystemTeamStates {}
