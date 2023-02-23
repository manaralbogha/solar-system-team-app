import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system_team/layout/home_solar_system_team_screen/cubit/states.dart';

import '../../../../models/model_get_appointment_team.dart';
import '../../../../shared/components/row_text_text_widget.dart';

import '../../../../shared/const/const.dart';
import '../../cubit/cubit.dart';
import '../container_user_details_widget/container_user_details_widget.dart';
import 'dialog_for_number_of_installation_days_widget/dialog_for_number_of_installation_days_widget.dart';

class CardHomeSolarSystemTeamWidget extends StatelessWidget {
  const CardHomeSolarSystemTeamWidget(
      {super.key,
      required this.teamAppointment,
      required this.teamAppointments});
  final DataAppointment teamAppointment;
  final List<DataAppointment>? teamAppointments;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeSolarSystemTeamCubit, HomeSolarSystemTeamStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = HomeSolarSystemTeamCubit.get(context);
        return Card(
          margin: EdgeInsets.all(6),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.5,
              color: teamAppointment.status == 'done'
                  ? Colors.green
                  : teamAppointment.status == 'accepted'
                      ? Colors.blue
                      : teamAppointment.status == 'rejected'
                          ? Colors.red
                          : Colors.orange,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'APPOINTMENT',
                  style: TextStyle(
                    fontSize: 23,
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
                RowTextText(
                  name: 'Company name : ',
                  number: teamAppointment.compane!.name.toString(),
                ),
                RowTextText(
                  name: 'Order type : ',
                  number: teamAppointment.type.toString(),
                ),
                RowTextText(
                  name: 'Order status : ',
                  number: teamAppointment.status.toString(),
                  color: teamAppointment.status == 'done'
                      ? Colors.green
                      : teamAppointment.status == 'accepted'
                          ? Colors.blue
                          : teamAppointment.status == 'rejected'
                              ? Colors.red
                              : Colors.orange,
                ),
                RowTextText(
                  name: 'Execution start time : ',
                  number: teamAppointment.startTime.toString(),
                  color: Colors.green,
                ),
                RowTextText(
                  name: 'Execution end time : ',
                  number: teamAppointment.finishTime.toString(),
                  color: Colors.red,
                ),
                RowTextText(
                  name: 'Total execution time : ',
                  number: teamAppointment.days == 1
                      ? "${teamAppointment.days}  DAY".toString()
                      : "${teamAppointment.days}  DAYS".toString(),
                ),
                const SizedBox(
                  height: 10,
                ),
                if (teamAppointment.customerDetails == true)
                  ContainerUserDetailsWidget(teamAppointment: teamAppointment),
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: teamAppointment.status == 'done'
                            ? Colors.green
                            : teamAppointment.status == 'accepted'
                                ? Colors.blue
                                : teamAppointment.status == 'rejected'
                                    ? Colors.red
                                    : Colors.orange,
                        side: BorderSide(
                          color: teamAppointment.status == 'done'
                              ? Colors.green
                              : teamAppointment.status == 'accepted'
                                  ? Colors.blue
                                  : teamAppointment.status == 'rejected'
                                      ? Colors.red
                                      : Colors.orange,
                          width: 1,
                        ),
                      ),
                      onPressed: () {
                        cubit.orderById = null;
                        if (teamAppointment.customerDetails == false) {
                          cubit.showDetails();
                          teamAppointments?.forEach((element) {
                            element.customerDetails = false;
                          });
                          cubit.getOrderById(
                              token: token, idOrder: teamAppointment.id);
                          teamAppointment.customerDetails = true;
                        } else {
                          teamAppointment.customerDetails = false;
                          cubit.showDetails();
                        }
                      },
                      child: teamAppointment.customerDetails == false
                          ? const Text('Show Customer Details')
                          : const Text('Lass Details'),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        cubit.orderById = null;

                        Navigator.pushNamed(
                          context,
                          '/OrderScreen',
                          arguments: {
                            'teamAppointment': teamAppointment,
                          },
                        );
                        teamAppointments?.forEach((element) {
                          element.customerDetails = false;
                        });
                      },
                      child: const Text('Open'),
                    ),
                  ],
                ),
                if (teamAppointment.type == 'detection')
                  DialogForNumberOfInstallationDaysWidget(
                    idOrder: teamAppointment.id!.toInt(),
                  ),
                if (teamAppointment.type == 'installation' &&
                    teamAppointment.status == 'accepted')
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        cubit.orderStatus(
                          idOrder: teamAppointment.id!.toInt(),
                          status: "Done",
                          token: token,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          // backgroundColor: Colors.white,
                          // foregroundColor: Color(0xff964B00),
                          // side: const BorderSide(
                          //   color: Color(0xff964B00),
                          //   width: 1,
                          // ),
                          ),
                      child: const Text('done'),
                    ),
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
