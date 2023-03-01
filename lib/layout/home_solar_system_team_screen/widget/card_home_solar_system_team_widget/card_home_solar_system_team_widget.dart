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
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    teamAppointment.compane!.name.toString(),
                    style: TextStyle(
                      fontSize: 25,
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
                ),
                SizedBox(
                  height: 10,
                ),
                // RowTextText(
                //   name: 'Company name : ',
                //   number: teamAppointment.compane!.name.toString(),
                // ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        color: Colors.green.shade50,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          teamAppointment.type.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        color: teamAppointment.status == 'done'
                            ? Colors.green.shade50
                            : teamAppointment.status == 'pending'
                                ? Colors.orange.shade50
                                : teamAppointment.status == 'accepted'
                                    ? Colors.green.shade50
                                    : Colors.red.shade50,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          teamAppointment.status.toString(),
                          style: TextStyle(
                            fontSize: 20,
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
                      ),
                    ),
                  ],
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.indigo.shade300),
                    children: <TextSpan>[
                      // const TextSpan(
                      //     text: 'The Date Of Execution Of The Order\n'),
                      const TextSpan(
                        text: "Data :  ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),

                      TextSpan(
                        text:
                            teamAppointment.startTime.toString() == '0001-01-01'
                                ? '-  -  -  -  -'
                                : ' ${teamAppointment.startTime.toString()}',
                        style: const TextStyle(
                          color: Colors.green,
                        ),
                      ),
                      const TextSpan(text: '   '),

                      TextSpan(
                        text:
                            teamAppointment.startTime.toString() == '0001-01-01'
                                ? '-  -  -  -  -'
                                : ' ${teamAppointment.finishTime.toString()}',
                        style: const TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      const TextSpan(text: '   '),
                      TextSpan(
                        text:
                            teamAppointment.startTime.toString() != '0001-01-01'
                                ? teamAppointment.days == 1
                                    ? "${teamAppointment.days}  DAY".toString()
                                    : "${teamAppointment.days}  DAYS".toString()
                                : '-  -  -  -  -',
                      )
                    ],
                  ),
                ),

                // RowTextText(
                //   name: 'Total execution time : ',
                //   number: teamAppointment.days == 1
                //       ? "${teamAppointment.days}  DAY".toString()
                //       : "${teamAppointment.days}  DAYS".toString(),
                // ),
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
                if (teamAppointment.type == 'detection' ||
                    teamAppointment.type == "maintenance")
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
