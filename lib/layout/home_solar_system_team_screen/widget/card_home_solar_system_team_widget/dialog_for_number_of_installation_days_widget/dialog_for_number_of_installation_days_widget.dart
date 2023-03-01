import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system_team/layout/home_solar_system_team_screen/cubit/cubit.dart';
import 'package:solar_system_team/layout/home_solar_system_team_screen/cubit/states.dart';

import '../../../../../shared/components/text_form_filed_widget.dart';
import '../../../../../shared/const/const.dart';

class DialogForNumberOfInstallationDaysWidget extends StatelessWidget {
  const DialogForNumberOfInstallationDaysWidget(
      {super.key, required this.idOrder});
  final int idOrder;
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return BlocConsumer<HomeSolarSystemTeamCubit, HomeSolarSystemTeamStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeSolarSystemTeamCubit.get(context);
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              cubit.installationDayController.text = '';
              showDialog<void>(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return AlertDialog(
                    //  backgroundColor: Colors.green.shade200,
                    title: const Text(
                      'Please specify the number of days required for installation',
                      style: TextStyle(
                        color: Colors.brown,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            buildTextFormFiled(
                              lableText: ('The number of installation days'),
                              controller: cubit.installationDayController,
                              iconPri: const Icon(Icons.date_range),
                              textType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter number of dyes';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text(
                          'Close',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text(
                          'Approve',
                          style: TextStyle(
                              color: Colors.brown, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            cubit.installationAppointment(
                              token: token,
                              installationDays: int.parse(
                                  cubit.installationDayController.text),
                              idOrder: idOrder,
                            );

                            Navigator.pop(context);
                            //cubit.appointmentInstallation();
                            cubit.appointmentTeam(token: token);
                          }
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text(
              'Determine the number of installation days',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        );
      },
    );
  }
}
