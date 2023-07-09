import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system_team/layout/home_solar_system_team_screen/cubit/states.dart';
import 'package:solar_system_team/modules/google_map/google_map.dart';

import '../../../../models/model_get_appointment_team.dart';
import '../../../../shared/components/row_text_text_widget.dart';
import '../../cubit/cubit.dart';

class ContainerUserDetailsWidget extends StatelessWidget {
  const ContainerUserDetailsWidget({super.key, required this.teamAppointment});
  final DataAppointment teamAppointment;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeSolarSystemTeamCubit, HomeSolarSystemTeamStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = HomeSolarSystemTeamCubit.get(context);
        // print(
        //     "${cubit.orderById!.data!.user!.location!.lat.toString()}kkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
        // print(
        //     "${cubit.orderById!.data!.user!.location!.long.toString()}jjjjjjjjjjjjjjjjjjjjjjjjjj");
        return ConditionalBuilder(
          condition: state is! ShowDetailsLoadingState,
          builder: (context) {
            if (state is! ShowDetailsErrorsState) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: teamAppointment.status == 'done'
                          ? Colors.green
                          : teamAppointment.status == 'accepted'
                              ? Colors.blue
                              : teamAppointment.status == 'rejected'
                                  ? Colors.red
                                  : Colors.orange,
                    )),
                padding: const EdgeInsets.all(6),
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
                        sized: 100,
                        sized1: 100,
                        name: 'Customer Name : ',
                        number: "${cubit.orderById!.data!.user!.name}"),
                    RowTextText(
                        sized: 100,
                        sized1: 100,
                        name: 'Customer Phone : ',
                        number: "${cubit.orderById!.data!.user!.phone}"),
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Container(
                              padding: const EdgeInsets.all(20),
                              height: double.infinity,
                              width: double.infinity,
                              child: Stack(
                                alignment: AlignmentDirectional.topEnd,
                                children: [
                                  googleMap(
                                      lat: 33.5131,
                                      // double.parse(cubit
                                      //     .orderById!.data!.user!.location!.lat
                                      //     .toString()),
                                      long: 36.2919
                                      // double.parse(cubit
                                      //     .orderById!.data!.user!.location!.long
                                      //     .toString()),
                                      ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Icon(
                                      Icons.exit_to_app,
                                      size: 50,
                                      color: Colors.blue,
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Colors.grey)),
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Text(
                              'SEE LOCATION',
                              style: TextStyle(fontSize: 20),
                            ),
                            Spacer(),
                            Icon(
                              Icons.location_history_outlined,
                              size: 30,
                            )
                          ],
                        ),
                      ),
                    )
                    // Container(
                    //   height: 400,
                    //   child:
                    // googleMap(
                    //     lat: // 33.5131,
                    //         double.parse(cubit
                    //             .orderById!.data!.user!.location!.lat
                    //             .toString()),
                    //     long: //36.2919
                    //         double.parse(cubit
                    //             .orderById!.data!.user!.location!.long
                    //             .toString()),
                    //   ),
                    // )
                    // ElevatedButton(
                    //     onPressed: () {
                    //       Navigator.pushNamed(context, '/googleMap');
                    //     },
                    //     child: Text('location'))
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
