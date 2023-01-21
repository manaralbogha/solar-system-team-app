import 'package:flutter/material.dart';

import '../../../../models/model_get_order_by_id.dart';
import '../../../../shared/components/row_text_text_widget.dart';
import '../../../../shared/const/const.dart';

class CardProductWidget extends StatelessWidget {
  const CardProductWidget(
      {super.key, required this.product, required this.products});
  final Products product;
  final List<Products>? products;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          width: 1,
          color: Colors.green,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 4,
      child: Column(
        children: [
          Text(
            product.product!.name.toString(),
            style: const TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.brown),
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
                  color: const Color.fromARGB(255, 76, 175, 79), width: 1),
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
                        number: product.product!.features![indexFeatures].value
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
    );
  }
}
