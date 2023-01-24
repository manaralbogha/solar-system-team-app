import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system_team/layout/home_solar_system_team_screen/cubit/cubit.dart';
import 'package:solar_system_team/layout/home_solar_system_team_screen/cubit/states.dart';

import '../../../../models/model_get_order_by_id.dart';

import '../../../../shared/const/const.dart';
import '../card_modify_products_widget/card_modify_products_widget.dart';

class ListViewModifyProductsWidget extends StatelessWidget {
  const ListViewModifyProductsWidget(
      {super.key, required this.products, required this.orderById});
  final List<Products> products;
  final OrderByIdModel orderById;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeSolarSystemTeamCubit, HomeSolarSystemTeamStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = HomeSolarSystemTeamCubit.get(context);
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return CardModifyProductWidget(
                    product: products[index],
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                cubit.addProductsToMap(products);
                cubit.addDevicesToMap(orderById.data!.devices!.toList());
                cubit.updateOrder(
                  idOrder: orderById.data!.id!.toInt(),
                  token: token,
                  totalVoltage: orderById.data!.totalVoltage.toString(),
                  totalPrice: orderById.data!.totalPrice.toString(),
                  hoursOnCharge: orderById.data!.hoursOnCharge.toString(),
                  hoursOnBattery: orderById.data!.hoursOnBettary.toString(),
                  space: orderById.data!.space.toString(),
                  lat: orderById.data!.location!.lat!.toDouble(),
                  long: orderById.data!.location!.long!.toDouble(),
                  area: orderById.data!.location!.area.toString(),
                  products: cubit.listProductsMap,
                  devices: cubit.listDeviceMap,
                );
                Navigator.pop(context);
              },
              child: const Text('Save Edit'),
            )
          ],
        );
      },
    );
  }
}
