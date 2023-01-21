import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system_team/layout/home_solar_system_team_screen/cubit/states.dart';

import '../../layout/home_solar_system_team_screen/cubit/cubit.dart';
import '../../models/model_get_order_by_id.dart';
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
                return SizedBox(
                  height: 400,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisExtent: 320,
                      childAspectRatio: 3 / 2,
                      //crossAxisSpacing: 2,
                      // mainAxisSpacing: 2,
                      maxCrossAxisExtent: 375,
                    ),
                    itemCount: cubit.orderById!.data!.devices!.length,
                    itemBuilder: ((context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 1,
                            color: Colors.green,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 4,
                        child: Column(
                          children: [
                            Center(
                              child: Image.network(
                                endPointImage +
                                    cubit.orderById!.data!.devices![index]
                                        .device!.image
                                        .toString(),
                                fit: BoxFit.cover,
                                height: 150,
                              ),
                            ),
                            Text(cubit.orderById!.data!.user!.name.toString()),
                            Text(cubit.orderById!.data!.user!.email.toString()),
                            Text(cubit.orderById!.data!.user!.phone.toString()),
                            Text(cubit.orderById!.data!.user!.id.toString()),
                          ],
                        ),
                      );
                    }),
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
