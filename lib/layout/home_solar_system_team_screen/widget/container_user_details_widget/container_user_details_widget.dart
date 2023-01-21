import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system_team/layout/home_solar_system_team_screen/cubit/states.dart';

import '../../../../shared/components/row_text_text_widget.dart';
import '../../cubit/cubit.dart';

class ContainerUserDetailsWidget extends StatelessWidget {
  const ContainerUserDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeSolarSystemTeamCubit, HomeSolarSystemTeamStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = HomeSolarSystemTeamCubit.get(context);
        return ConditionalBuilder(
          condition: state is! ShowDetailsLoadingState,
          builder: (context) {
            if (state is! ShowDetailsErrorsState) {
              return Container(
                padding: const EdgeInsets.all(6),
                color: Colors.green.shade100,
                child: Column(
                  children: [
                    const Text(
                      'CUSTOMER DETAILS',
                      style: TextStyle(
                          color: Color(0xff964B00),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    RowTextText(
                        name: 'Customer Name : ',
                        number: "${cubit.orderById!.data!.user!.name}"),
                    RowTextText(
                        name: 'Customer Phone : ',
                        number: "${cubit.orderById!.data!.user!.phone}"),
                  ],
                ),
              );
            }
            return const Text('No Data');
          },
          fallback: (context) {
            return const Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }
}
