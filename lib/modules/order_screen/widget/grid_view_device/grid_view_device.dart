import 'package:flutter/material.dart';

import '../../../../models/model_get_order_by_id.dart';
import '../card_device/card_device.dart';

class GridViewDeviceWidget extends StatelessWidget {
  const GridViewDeviceWidget({super.key, required this.devices});
  final List<Devices>? devices;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: const Color.fromARGB(19, 33, 149, 243),
        border:
            Border.all(color: const Color.fromARGB(255, 76, 175, 79), width: 1),
      ),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          const Text(
            'DEVICES',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.brown,
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
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
