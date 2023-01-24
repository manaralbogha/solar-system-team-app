import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system_team/layout/home_solar_system_team_screen/cubit/cubit.dart';
import 'package:solar_system_team/layout/home_solar_system_team_screen/cubit/states.dart';
import 'package:solar_system_team/modules/modify_products_screen/widget/list_view_modify_products_widget/list_view_modify_products_widget.dart';

import '../../models/model_get_order_by_id.dart';

class ModifyProductsScreen extends StatelessWidget {
  const ModifyProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arg =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final List<Products> products = arg['products'];
    final OrderByIdModel orderById = arg['orderById'];

    return BlocConsumer<HomeSolarSystemTeamCubit, HomeSolarSystemTeamStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = HomeSolarSystemTeamCubit.get(context);
        return Scaffold(
            appBar: AppBar(),
            body: ListViewModifyProductsWidget(
              products: products,
              orderById: orderById,
            )

            // body:
            );
      },
    );
  }
}

// CardProductWidget(
//   product: products[index],
//   products: products,
// ),
// // ElevatedButton(onPressed: () {}, child: Text('Modify')),
// // Column(
// //   children: List.generate(cubit.panel!.length, (index) {
// //     return Text(cubit.panel![index].name);
// //   }),
// //),
// if (products[index].product!.categore!.id == 2)
//   DropDownButtonWidget(
//     products: cubit.panel,
//   ),
// if (products[index].product!.categore!.id == 3)
//   DropDownButtonWidget(products: cubit.inverter),
// if (products[index].product!.categore!.id == 4)
//   DropDownButtonWidget(products: cubit.batter),
// if (products[index].product!.categore!.id == 5)
//   DropDownButtonWidget(products: cubit.generator),
