import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system_team/layout/home_solar_system_team_screen/cubit/states.dart';

import '../../../../models/model_get_appointment_team.dart';
import '../../../../shared/components/row_text_text_widget.dart';
import '../../../../shared/components/text_form_filed_widget.dart';
import '../../../../shared/const/const.dart';
import '../../cubit/cubit.dart';
import '../container_user_details_widget/container_user_details_widget.dart';
import 'dialog_for_number_of_installation_days_widget/dialog_for_number_of_installation_days_widget.dart';

class CardHomeSolarSystemTeamWidget extends StatelessWidget {
  CardHomeSolarSystemTeamWidget(
      {super.key,
      required this.teamAppointment,
      required this.teamAppointments});
  DataAppointment teamAppointment;
  List<DataAppointment>? teamAppointments;

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
            side: const BorderSide(
              width: 1.5,
              // color: Colors.green,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'APPOINTMENT',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
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
                  color: Colors.orange,
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
                  number: "${teamAppointment.days}  DAY".toString(),
                ),
                const SizedBox(
                  height: 10,
                ),
                if (teamAppointment.customerDetails == true)
                  const ContainerUserDetailsWidget(),
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Color(0xff964B00),
                        side: const BorderSide(
                          color: Color(0xff964B00),
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
                    Spacer(),
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
                      child: Text('Open'),
                    ),
                  ],
                ),
                if (teamAppointment.type == 'detection')
                  DialogForNumberOfInstallationDaysWidget(
                      idOrder: teamAppointment.id!.toInt()),
              ],
            ),
          ),
        );
      },
    );
  }
}
