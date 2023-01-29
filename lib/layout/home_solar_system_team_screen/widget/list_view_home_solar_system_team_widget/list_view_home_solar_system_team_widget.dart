import 'package:flutter/material.dart';

import '../../../../models/model_get_appointment_team.dart';
import '../../../../shared/components/row_text_text_widget.dart';
import '../card_home_solar_system_team_widget/card_home_solar_system_team_widget.dart';

class ListViewHomeSolarSystemTeamWidget extends StatelessWidget {
  ListViewHomeSolarSystemTeamWidget(
      {super.key, required this.teamAppointments});
  List<DataAppointment>? teamAppointments;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: teamAppointments!.length,
      itemBuilder: (context, index) {
        return CardHomeSolarSystemTeamWidget(
          teamAppointment: teamAppointments![index],
          teamAppointments: teamAppointments,
        );
      },
    );
  }
}
