import 'package:flutter/material.dart';

import '../../../../../models/model_get_order_by_id.dart';
import '../card_add_other_products_widget/card_add_other_products_widget.dart';

class ListViewAddOtherProductsWidget extends StatelessWidget {
  const ListViewAddOtherProductsWidget(
      {super.key, required this.allProductCompany, required this.products});
  final List<Product> allProductCompany;
  final List<Products> products;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Colors.grey.shade300,
        border:
            Border.all(color: const Color.fromARGB(255, 76, 175, 79), width: 1),
      ),
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      child: ListView.builder(
        itemCount: allProductCompany.length,
        itemBuilder: (context, index) {
          return CardAddOtherProductWidget(
            productCompany: allProductCompany[index],
            products: products,
          );
        },
      ),
    );
  }
}
