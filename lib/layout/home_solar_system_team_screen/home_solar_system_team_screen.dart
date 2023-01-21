import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system_team/layout/home_solar_system_team_screen/cubit/cubit.dart';
import 'package:solar_system_team/layout/home_solar_system_team_screen/cubit/states.dart';
import 'package:solar_system_team/layout/home_solar_system_team_screen/widget/list_view_home_solar_system_team_widget/list_view_home_solar_system_team_widget.dart';

class HomeSolarSystemTeamScreen extends StatelessWidget {
  const HomeSolarSystemTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeSolarSystemTeamCubit, HomeSolarSystemTeamStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = HomeSolarSystemTeamCubit.get(context);
        // cubit.teamAppointment!.data?.forEach((element) {
        //   element.customerDetails = false;
        // });
        return Scaffold(
          appBar: AppBar(),
          body: ConditionalBuilder(
            condition: state is! AppointmentTeamLoadingState,
            builder: (context) {
              if (state is! AppointmentTeamErrorsState) {
                return ListViewHomeSolarSystemTeamWidget(
                  teamAppointments: cubit.teamAppointment!.data,
                );
              }
              return const Center(child: CircularProgressIndicator());
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
