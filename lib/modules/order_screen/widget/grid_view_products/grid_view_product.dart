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
          height: 400,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            color: const Color.fromARGB(19, 33, 149, 243),
            border: Border.all(
                color: const Color.fromARGB(255, 76, 175, 79), width: 1),
          ),
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              Builder(builder: (context) {
                if (teamAppointment.type == "detection") {
                  return Row(
                    children: [
                      const Text(
                        'PRODUCTS',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
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
                return const Center(
                  child: Text(
                    'PRODUCTS',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                );
              }),
              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    mainAxisExtent: 320,
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
