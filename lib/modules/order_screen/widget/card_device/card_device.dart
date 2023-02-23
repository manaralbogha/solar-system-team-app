import 'package:flutter/material.dart';

import '../../../../models/model_get_appointment_team.dart';
import '../../../../models/model_get_order_by_id.dart';
import '../../../../shared/components/row_text_text_widget.dart';
import '../../../../shared/const/const.dart';

class CardDeviceWidget extends StatelessWidget {
  const CardDeviceWidget(
      {super.key, required this.device, required this.teamAppointment});
  final Devices device;
  final DataAppointment teamAppointment;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 1,
          color: teamAppointment.status == 'done'
              ? Colors.green
              : teamAppointment.status == 'accepted'
                  ? Colors.blue
                  : teamAppointment.status == 'rejected'
                      ? Colors.red
                      : Colors.orange,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 4,
      child: Column(
        children: [
          Text(
            device.device!.name.toString(),
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
          Center(
            child: Image.network(
              endPointImage + device.device!.image.toString(),
              fit: BoxFit.cover,
              height: 130,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 100,
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              color: const Color.fromARGB(19, 33, 149, 243),
              border: Border.all(
                  color: teamAppointment.status == 'done'
                      ? Colors.green
                      : teamAppointment.status == 'accepted'
                          ? Colors.blue
                          : teamAppointment.status == 'rejected'
                              ? Colors.red
                              : Colors.orange,
                  width: 1),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.green.withOpacity(0.5),
              //     spreadRadius: 0.3,
              //     blurRadius: 5,
              // offset: Offset(0, 3), // changes position of shadow
              //   ),
              // ],
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  RowTextText(
                    name: 'Voltage : ',
                    number: device.device!.voltage.toString(),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: RowTextText(
                      name: 'Voltage Power : ',
                      number: device.device!.voltagePower.toString(),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
