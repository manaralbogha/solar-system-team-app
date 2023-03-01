import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system_team/layout/home_solar_system_team_screen/cubit/cubit.dart';
import 'package:solar_system_team/layout/home_solar_system_team_screen/cubit/states.dart';
import 'package:solar_system_team/shared/const/const.dart';

import '../../../../models/model_get_appointment_team.dart';
import '../../../../models/model_get_order_by_id.dart';
import '../card_product/card_product.dart';

class GridViewProductWidget extends StatelessWidget {
  const GridViewProductWidget(
      {super.key,
      required this.products,
      required this.orderById,
      required this.teamAppointment});
  final List<Products>? products;
  final OrderByIdModel? orderById;
  final DataAppointment teamAppointment;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeSolarSystemTeamCubit, HomeSolarSystemTeamStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = HomeSolarSystemTeamCubit.get(context);
        return Container(
          height: teamAppointment.type == "maintenance" ? double.infinity : 400,
          decoration: BoxDecoration(
            color: const Color.fromARGB(19, 33, 149, 243),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            border: Border.all(
                color: teamAppointment.status == 'done'
                    ? Colors.green
                    : teamAppointment.status == 'accepted'
                        ? Colors.blue
                        : teamAppointment.status == 'rejected'
                            ? Colors.red
                            : Colors.orange,
                width: 1),
          ),
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              Builder(builder: (context) {
                if (teamAppointment.type == "detection" ||
                    teamAppointment.type == "maintenance") {
                  return Row(
                    children: [
                      Text(
                        'PRODUCTS',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: teamAppointment.status == 'done'
                              ? Colors.green
                              : teamAppointment.status == 'accepted'
                                  ? Colors.blue
                                  : teamAppointment.status == 'rejected'
                                      ? Colors.red
                                      : Colors.orange,
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          cubit.panel = [];
                          cubit.batter = [];
                          cubit.inverter = [];
                          cubit.generator = [];
                          cubit.getProductsForCompanyId(
                              token: token,
                              idCompany: orderById!
                                  .data!.appointment!.compane!.id!
                                  .toInt());
                          Navigator.pushNamed(
                            context,
                            '/ModifyProductsScreen',
                            arguments: {
                              'products': products,
                              'orderById': orderById
                            },
                          );
                        },
                        child: const Text(
                          'Edit Products',
                        ),
                      ),
                    ],
                  );
                }
                return Center(
                  child: Text(
                    'PRODUCTS',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: teamAppointment.status == 'done'
                          ? Colors.green
                          : teamAppointment.status == 'accepted'
                              ? Colors.blue
                              : teamAppointment.status == 'rejected'
                                  ? Colors.red
                                  : Colors.orange,
                    ),
                  ),
                );
              }),
              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    mainAxisExtent: 300,
                    childAspectRatio: 3 / 2,
                    //crossAxisSpacing: 2,
                    // mainAxisSpacing: 2,
                    maxCrossAxisExtent: 300,
                  ),
                  itemCount: products!.length,
                  itemBuilder: ((context, indexProducts) {
                    return CardProductWidget(
                      product: products![indexProducts],
                      products: products,
                      teamAppointment: teamAppointment,
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
