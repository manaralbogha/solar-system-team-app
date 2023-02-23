import 'package:flutter/material.dart';

import '../../../../models/model_get_appointment_team.dart';
import '../../../../models/model_get_order_by_id.dart';
import '../card_device/card_device.dart';

class GridViewDeviceWidget extends StatelessWidget {
  const GridViewDeviceWidget(
      {super.key, required this.devices, required this.teamAppointment});
  final List<Devices>? devices;
  final DataAppointment teamAppointment;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: const Color.fromARGB(19, 33, 149, 243),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        border: Border.all(
            color: teamAppointment.status == 'done'
                ? Colors.green
                : teamAppointment.status == 'accepted'
                    ? Colors.blue
                    : teamAppointment.status == 'rejected'
                        ? Colors.red
                        : Colors.orange,
            width: 1),
      ),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          Text(
            'DEVICES',
            style: TextStyle(
              fontSize: 28,
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
          Expanded(
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisExtent: 300,
                childAspectRatio: 3 / 2,
                //crossAxisSpacing: 2,
                // mainAxisSpacing: 2,
                maxCrossAxisExtent: 300,
              ),
              itemCount: devices!.length,
              itemBuilder: ((context, index) {
                return CardDeviceWidget(
                  device: devices![index],
                  teamAppointment: teamAppointment,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
