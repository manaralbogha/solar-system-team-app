import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system_team/layout/home_solar_system_team_screen/cubit/states.dart';
import 'package:solar_system_team/modules/order_screen/widget/grid_view_device/grid_view_device.dart';
import 'package:solar_system_team/modules/order_screen/widget/grid_view_products/grid_view_product.dart';
import 'package:solar_system_team/shared/components/row_text_text_widget.dart';

import '../../layout/home_solar_system_team_screen/cubit/cubit.dart';

import '../../shared/const/const.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final arg =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    // OrderByIdModel orderById = arg['OrderById'];
    return BlocConsumer<HomeSolarSystemTeamCubit, HomeSolarSystemTeamStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = HomeSolarSystemTeamCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: ConditionalBuilder(
            condition: state is! ShowDetailsLoadingState,
            builder: (context) {
              if (state is! ShowDetailsErrorsState) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      GridViewProductWidget(
                          products: cubit.orderById!.data!.products,
                          orderById: cubit.orderById),
                      GridViewDeviceWidget(
                          devices: cubit.orderById!.data!.devices),
                    ],
                  ),
                );
              } else {
                return const Center(child: Text('No Internet'));
              }
            },
            fallback: (context) {
              return const Center(child: CircularProgressIndicator());
            },
          ),
        );
      },
    );
  }
}
