import 'package:flutter/material.dart';

import '../../../../models/model_get_appointment_team.dart';
import '../../../../models/model_get_order_by_id.dart';
import '../../../../shared/components/row_text_text_widget.dart';
import '../../../../shared/const/const.dart';

class CardProductWidget extends StatelessWidget {
  const CardProductWidget(
      {super.key,
      required this.product,
      required this.products,
      required this.teamAppointment});
  final Products product;
  final List<Products>? products;
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
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.product!.name.toString(),
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
            Center(
              child: Image.network(
                endPointImage + product.product!.image.toString(),
                fit: BoxFit.cover,
                height: 150,
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
                    Column(
                      children: List.generate(product.product!.features!.length,
                          (indexFeatures) {
                        return RowTextText(
                          name:
                              "${product.product!.features![indexFeatures].name.toString()} : ",
                          number: product
                              .product!.features![indexFeatures].value
                              .toString(),
                        );
                      }),
                    ),
                    RowTextText(
                      name: 'Price : ',
                      number: product.product!.price.toString(),
                    ),
                    RowTextText(
                      name: 'Amount : ',
                      number: product.productAmmount.toString(),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
